import XMonad
import XMonad.Actions.CopyWindow (copyToAll)
import XMonad.Actions.SpawnOn
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import Data.List (isInfixOf)


main = xmonad $ def
  {
    terminal = "alacritty",
    modMask = mod4Mask,
    borderWidth = 0,
    focusFollowsMouse = False,
    logHook = fadeWindowsLogHook $ composeAll [
      opaque,
      isUnfocused --> transparency 0.2
    ],
    manageHook = composeAll
    [
      className =? "Alacritty" --> doShift "1",
      className =? "KeePassXC" --> doShift "2",
      className =? "Chromium" --> doShift "3",
      stringProperty "WM_WINDOW_ROLE" =? "pop-up" --> doFloat <+> doF copyToAll,
      (isInfixOf "is sharing your screen." <$> stringProperty "_NET_WM_NAME") --> doHideIgnore
    ] <+> manageSpawn <+> manageHook def,
    startupHook = do
      spawnOnce "alacritty"
      spawnOnce "chromium"
      spawnOnce "keepassxc"
  } `additionalKeysP` [
    ("M-c", spawn "dunstctl close-all"),
    ("<Print>", spawn "~/bin/screenshot.sh"),
    ("<XF86MonBrightnessUp>", spawn "~/bin/dunst/backlight.sh 1"),
    ("<XF86MonBrightnessDown>", spawn "~/bin/dunst/backlight.sh -1"),
    ("<XF86AudioLowerVolume>", spawn "~/bin/dunst/volume.sh 2dB- unmute"),
    ("<XF86AudioRaiseVolume>", spawn "~/bin/dunst/volume.sh 2dB+ unmute"),
    ("<XF86AudioMute>", spawn "~/bin/dunst/volume.sh mute"),
    ("<XF86Calculator>", spawn "mate-calculator")
  ] `removeMouseBindings` [
    (mod4Mask, button1),
    (mod4Mask, button2),
    (mod4Mask, button3)
  ]
