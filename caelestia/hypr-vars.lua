return{
	
	------------------------
	-- Aps
	terminal = "kitty",
	editor = "kitty nvim",
	fileExplorer = "kitty ranger",

	----------------
	-- Window rules
	
	-- Gaps 
	workspaceGaps = 100,
	windowGapsIn = 15,
	windowGapsOut = 20,
	singleWindowGapsOut = 30,

	-- Other options
	windowOpacity = 1.0,
	windowRounding = 30,
	windowBorderSize = 3,
	shadowEnabled  = false,
	blurEnabled = false,



	------------------------ 
	-- Keybindings
	kbGoToWs                   = "SUPER",

	-- Here I mess up the original keybindings so the new ones are all good
	kbMoveWinToWsNext          = "SUPER + CTRL + SHIFT + A + Down",
	kbMoveWinToWsPrev          = "SUPER + CTRL + SHIFT + A +  Up",
	kbNextWs                   = "SUPER + CTRL + A + Down", 
	kbPrevWs                   = "SUPER + CTRL + A + Up",   

	-- To-use keybindings
	kbMoveWinToWsSpecial       = "SUPER + ALT + CTRL + Up",
	kbMoveWinFromWsSpecial     = "CTRL + SUPER + ALT + Down",
	kbNextWs_new                   = "SUPER + CTRL + Down", 
	kbPrevWs_new                   = "SUPER + CTRL + Up",
	kbMoveWinToWsNext_new          = "SUPER + CTRL + SHIFT + Down",
	kbMoveWinToWsPrev_new          = "SUPER + CTRL + SHIFT +  Up",

	-- To move between monitors
	kbFocusMonitorNext   = "SUPER + CTRL + Right",
	kbFocusMonitorPrev   = "SUPER + CTRL + Left",
	kbMoveWinToMonNext   = "SUPER + CTRL + SHIFT + Right", 
	kbMoveWinToMonPrev   = "SUPER + CTRL + SHIFT + Left",  

	-- Window Actions
	kbWindowDecreaseWidth      = { "SUPER + Minus", "SUPER + ALT + Left" },
	kbWindowIncreaseWidth      = { "SUPER + Equal", "SUPER + ALT + Right" },
	kbWindowDecreaseHeight     = { "SUPER + SHIFT + Minus", "SUPER + ALT + Up" },
	kbWindowIncreaseHeight     = { "SUPER + SHIFT + Equal", "SUPER + ALT + Down" },

	kbMoveWindow               = "SUPER + Z",
	kbResizeWindow             = "SUPER + X",
	kbPinWindow                = "SUPER + SHIFT + ALT +  P",
	kbWindowFullscreen         = "SUPER + F",
	kbToggleWindowFloating     = "SUPER + Space",
	kbCloseWindow              = "SUPER + C",

	-- Special workspaces toggles
	kbSpecialWs                = "SUPER + S",


	-- Apps
	kbTerminal                 = "SUPER + Return",
	kbBrowser                  = "SUPER + W",
	kbEditor                   = "SUPER + E",
	kbFileExplorer             = "SUPER + R",

	-- Utilities

	kbScreenshotRegion         = "SUPER + P",


	-- Media
	kbMediaToggle              = "CTRL + SUPER + Space",
	kbMediaNext                = "CTRL + SUPER + Equal",
	kbMediaPrev                = "CTRL + SUPER + Minus",
	kbShowPanels               = "SUPER + N",
	-- Clipboard and emoji picker
	kbClipboard                = "SUPER + V",
	kbClipboardDel             = "SUPER + ALT + V",
	kbClipboardPasteLatest     = "CTRL + SHIFT + ALT + V",
	kbEmoji                    = "SUPER + Period",

	-- Window Group
	kbWindowCycleNext          = "CTRL + TAB",
	kbWindowCyclePrev          = "SHIFT + CTRL + TAB",
	kbWindowGroupCycleNext     = "CTRL + ALT + TAB",
	kbWindowGroupCyclePrev     = "CTRL + SHIFT + ALT + TAB",
	kbUngroup                  = "SUPER + U",
	kbToggleGroup              = "SUPER + Comma",
	kbGroupLockActive          = "SUPER + SHIFT + Comma",
}
