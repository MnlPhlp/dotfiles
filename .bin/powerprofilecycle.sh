#!/bin/bash
#
# Script to cycle through power-profiles-daemon profiles. Handy for integration
# with waybar, i3blocks and others. When run it will cycle to next profile and
# output a corresponding fa-icon for displaying in a bar. With the -m toggle,
# the script will not cycle profiles, rather just print fa-icon corresponding to
# current profile.
#

PSET="powerprofilesctl set"
# PSET="system76-power profile"
PGET="powerprofilesctl get"

get_profile () {
  $PGET
}

while getopts "mhj" opt; do
  case $opt in
    m)
      case $(get_profile) in
        performance)
          echo 🗠 && exit 0
          ;;
        power-saver)
          echo   && exit 0
          ;;
        balanced)
          echo   && exit 0 
      esac
      ;;
    j)
      case $(get_profile) in
        performance)
          echo '{"tooltip": "performance", "text": "🗠"}' && exit 0
          ;;
        power-saver)
          echo '{"tooltip": "battery", "text": " "}' && exit 0
          ;;
        balanced)
          echo '{"tooltip": "balanced", "text": " "}' && exit 0
      esac
      ;;
    h)
      echo -e "Run script without arguments to cycle power profiles and print icon. \n-m Monitor. Get power profile and print icon. \n-j Json. Print json text. \n-h Help. Show this help text"  
      exit 0
      ;;
    *)
      echo "Invalid option. Try -h."
      exit 1
  esac
done

case $(get_profile) in
  performance)
    $PSET power-saver && echo   && exit 0
    ;;
  power-saver)
    $PSET balanced && echo   && exit 0
    ;;
  balanced)
    $PSET performance && echo  && exit 0
    ;;
esac

echo "Could not find power profile match. Is power-profiles-daemon running?"
exit 1
