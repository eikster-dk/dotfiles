# Custom system menu extension
# Adds "Lock + Screen Off" option that locks and turns off the display

show_system_menu() {
  local options="󱄄  Screensaver\n  Lock\n󰶐  Lock + Screen Off"
  [[ ! -f ~/.local/state/omarchy/toggles/suspend-off ]] && options="$options\n󰒲  Suspend"
  omarchy-hibernation-available && options="$options\n󰤁  Hibernate"
  options="$options\n󰍃  Logout\n󰜉  Restart\n󰐥  Shutdown"

  case $(menu "System" "$options") in
  *Screensaver*) omarchy-launch-screensaver force ;;
  *"Lock + Screen Off"*) $HOME/.local/bin/omarchy-lock-screen-off ;;
  *Lock*) omarchy-lock-screen ;;
  *Suspend*) systemctl suspend ;;
  *Hibernate*) systemctl hibernate ;;
  *Logout*) omarchy-system-logout ;;
  *Restart*) omarchy-system-reboot ;;
  *Shutdown*) omarchy-system-shutdown ;;
  *) back_to show_main_menu ;;
  esac
}
