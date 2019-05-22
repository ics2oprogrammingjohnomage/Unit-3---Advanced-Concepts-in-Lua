-----------------------------------------------------------------------------------------
-- Title: Dragging Answers into Boxes
-- Name: John Omage
-- Course: ICS2O/3C
-- This program calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------
-- Go to the intro screen
composer.gotoScene( "level1_screen" )