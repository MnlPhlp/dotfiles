#!/bin/bash
#
# Script to cycle through power-profiles-daemon profiles. Handy for integration
# with waybar, i3blocks and others. When run it will cycle to next profile and
# output a corresponding fa-icon for displaying in a bar. With the -m toggle,
# the script will not cycle profiles, rather just print fa-icon corresponding to
# current profile.
#

# PSET="powerprofilesctl set"
# PGET="powerprofilesctl get"


PSET="system76-power profile"

get_profile () {
  system76-power profile | grep Profile | cut -b 16-100   
}

while getopts "mhj" opt; do
  case $opt in
    m)
      case $(get_profile) in
        Performance)
          echo 🗠 && exit 0
          ;;
        Battery)
          echo   && exit 0
          ;;
        Balanced)
          echo   && exit 0 
      esac
      ;;
    j)
      case $(get_profile) in
        Performance)
          echo '{"tooltip": "performance", "text": "🗠"}' && exit 0
          ;;
        Battery)
          echo '{"tooltip": "battery", "text": " "}' && exit 0
          ;;
        Balanced)
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
  Performance)
    $PSET battery && echo   && exit 0
    ;;
  Battery)
    $PSET balanced && echo   && exit 0
    ;;
  Balanced)
    $PSET performance && echo  && exit 0
    ;;
esac

echo "Could not find power profile match. Is power-profiles-daemon running?"
exit 1
