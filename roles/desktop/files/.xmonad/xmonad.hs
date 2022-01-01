import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.FadeWindows
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

main = xmonad $ def
  {
    terminal = "alacritty",
    modMask = mod4Mask,
    borderWidth = 0,
    logHook = fadeWindowsLogHook $ composeAll [
      opaque,
      isUnfocused --> transparency 0.3
    ],
    manageHook = composeAll
    [
      className =? "Alacritty" --> doShift "1",
      className =? "KeePassXC" --> doShift "2",
      className =? "Chromium" --> doShift "3",
      className =? "Min" --> doShift "4",
      className =? "VirtualBox Manager" --> doShift "9",
      className =? "VirtualBox Machine" --> doShift "9"
    ] <+> manageSpawn <+> manageHook def,
    startupHook = do
      spawnOnce "alacritty"
      spawnOnce "chromium gmail.com app.slack.com/client teams.microsoft.com live.com"
      spawnOnce "min"
      spawnOnce "keepassxc"
  } `additionalKeysP` [
    -- ("<XF86MonBrightnessUp>", spawn "xbacklight +20"),
    -- ("<XF86MonBrightnessDown>", spawn "xbacklight -20"),
    ("<Print>", spawn "~/bin/screenshot.sh"),
    ("<XF86AudioLowerVolume>", spawn "~/bin/dunst/volume.sh 2dB- unmute"),
    ("<XF86AudioRaiseVolume>", spawn "~/bin/dunst/volume.sh 2dB+ unmute"),
    ("<XF86AudioMute>", spawn "~/bin/dunst/volume.sh mute"),
    ("<XF86Calculator>", spawn "mate-calculator")
  ]
