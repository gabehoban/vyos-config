#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Configure forward filter:
#   forward_rule <rule_number> <inbound_interface_group> <outbound_interface_group> accept
#   forward_rule <rule_number> <inbound_interface_group> <outbound_interface_group> jump
#   forward_rule <rule_number> ignored <outbound_interface_group> drop
#
# interface_group do not have IG_ prefix - that is substituted
#
# jump target is <inbound>-<outbound> named rule
#
forward_rule_number=101
function forward_rule {
  rule=$((forward_rule_number))
  inbound=$1
  outbound=$2
  action=$3

  case $action in
    accept)
      set firewall ipv4 forward filter rule $rule action $action
      set firewall ipv4 forward filter rule $rule inbound-interface group IG_$inbound
      set firewall ipv4 forward filter rule $rule outbound-interface group IG_$outbound
      ;;
    drop)
      set firewall ipv4 forward filter rule $rule action $action
      set firewall ipv4 forward filter rule $rule outbound-interface group IG_$outbound
      ;;
    jump)
      set firewall ipv4 forward filter rule $rule action $action
      set firewall ipv4 forward filter rule $rule inbound-interface group IG_$inbound
      set firewall ipv4 forward filter rule $rule outbound-interface group IG_$outbound
      set firewall ipv4 forward filter rule $rule jump-target ${inbound}-${outbound}
      ;;
  esac

  forward_rule_number=$((forward_rule_number+5))
}

# Configure input filter
#   input_rule <rule_number> <inbound_interface_group> jump
#   input_rule <rule_number> any drop
#
# interface_group do not have IG_ prefix - that is substituted
#
# jump target is <inbound>-local named rule
#
input_rule_number=101
function input_rule {
  rule=$((input_rule_number))
  inbound=$1
  action=$2

  case $action in
    drop)
      set firewall ipv4 input filter rule $rule action $action
      ;;
    jump)
      set firewall ipv4 input filter rule $rule action $action
      set firewall ipv4 input filter rule $rule inbound-interface group IG_$inbound
      set firewall ipv4 input filter rule $rule jump-target ${inbound}-local
      ;;
  esac

  input_rule_number=$((input_rule_number+5))
}

# Configure output filter
#   output_rule <rule_number> <outbound_interface_group> jump
#   output_rule <rule_number> any drop
#
# interface_group do not have IG_ prefix - that is substituted
#
# jump target is local-<outbound> named rule
#
output_rule_number=101
function output_rule {
  rule=$((output_rule_number))
  outbound=$1
  action=$2

  case $action in
    drop)
      set firewall ipv4 output filter rule $rule action $action
      ;;
    jump)
      set firewall ipv4 output filter rule $rule action $action
      set firewall ipv4 output filter rule $rule outbound-interface group IG_$outbound
      set firewall ipv4 output filter rule $rule jump-target local-$outbound
      ;;
  esac

  output_rule_number=$((output_rule_number+5))
}

function handle_traffic {
  shift # Ignore $1 which is to
  outbound=$1
  shift
  shift # Ignore next word which is from

  # begin traffic
  if ! test "$outbound" == "local"; then
    forward_rule $outbound $outbound accept
  fi

  for inbound in $*; do
    if test "$outbound" == "local"; then
      input_rule $inbound jump
    elif test "$inbound" == "local"; then
      output_rule $outbound jump
    else
      forward_rule $inbound $outbound jump
    fi
  done

  # end traffic
  if test "$outbound" == "local"; then
    input_rule any drop
    output_rule any drop
  else
    forward_rule any $outbound drop
  fi
}

# Default forward policy
set firewall ipv4 forward filter default-action 'accept'
set firewall ipv4 forward filter rule 1 action 'accept'
set firewall ipv4 forward filter rule 1 state established 'enable'
set firewall ipv4 forward filter rule 2 action 'drop'
set firewall ipv4 forward filter rule 2 state invalid 'enable'
set firewall ipv4 forward filter rule 3 action 'accept'
set firewall ipv4 forward filter rule 3 state related 'enable'

# Default input policy
set firewall ipv4 input filter default-action 'accept'
set firewall ipv4 input filter rule 1 action 'accept'
set firewall ipv4 input filter rule 1 state established 'enable'
set firewall ipv4 input filter rule 2 action 'drop'
set firewall ipv4 input filter rule 2 state invalid 'enable'
set firewall ipv4 input filter rule 3 action 'accept'
set firewall ipv4 input filter rule 3 state related 'enable'

# Default output policy
set firewall ipv4 output filter default-action 'accept'
set firewall ipv4 output filter rule 1 action 'accept'
set firewall ipv4 output filter rule 1 state established 'enable'
set firewall ipv4 output filter rule 2 action 'drop'
set firewall ipv4 output filter rule 2 state invalid 'enable'
set firewall ipv4 output filter rule 3 action 'accept'
set firewall ipv4 output filter rule 3 state related 'enable'

# Ensure VyOS can talk to itself
set firewall ipv4 output filter rule 10 action accept
set firewall ipv4 output filter rule 10 source group address-group router-addresses
set firewall ipv4 output filter rule 10 destination group address-group router-addresses
set firewall ipv4 input  filter rule 10 action accept
set firewall ipv4 input  filter rule 10 source group address-group router-addresses
set firewall ipv4 input  filter rule 10 destination group address-group router-addresses

handle_traffic to lan        from trusted guest iot servers containers local wan
handle_traffic to trusted    from lan guest iot servers containers local wan
handle_traffic to guest      from lan trusted iot servers containers local wan
handle_traffic to iot        from lan trusted guest servers containers local wan
handle_traffic to servers    from lan trusted guest iot containers local wan
handle_traffic to containers from lan trusted guest iot servers local wan
handle_traffic to wan        from lan trusted guest iot servers containers local
handle_traffic to local      from lan trusted guest iot servers containers wan
