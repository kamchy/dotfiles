import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Paste
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


-- zielony: 87af87
-- zolty: afaf87
-- rozpwu d78787

myworkspaces = ["main", "web", "prog", "fun", "trash"]
myManageHook  = composeAll
    [ className =? "firefox" --> doShift "web"
    ,  className =? "Gimp" --> doShift "fun"
    ,  className =? "Gimp" --> doFloat
    ]
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/karma/.xmobarrc"
    xmonad $ defaultConfig
        { workspaces = myworkspaces
        , focusedBorderColor = "red"
        , normalBorderColor = "#000000"
        , borderWidth = 2
        , manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#87af87" "" . shorten 50
                        , ppLayout = const ""
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask , xK_f), spawn "~/prog/firefox/firefox")
        , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((mod4Mask .|. shiftMask, xK_Print), spawn "xfce4-screenshooter -r")
        , ((controlMask, xK_Print), spawn " xfce4-screenshooter -s 2")
        , ((0, xK_Print), spawn "xfce4-screenshooter")
         -- X-selection-paste buffer
        , ((0, xK_Insert), pasteSelection)
        ] 
