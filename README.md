# Issue polling input after changing display mode on macOS

## How to test

- Pressing Enter replaces the gray screen with a pink screen for 0.5 seconds.
- Pressing Space toggles between WINDOW_MODE_FULLSCREEN and WINDOW_MODE_WINDOWED

### Expected:

When changing between windowed and fullscreen display modes. Typing a key that has not been held down will be detectable by Input.is_action_just_pressed

### Actual:

Sometimes, a key needs to be pressed twice to trigger Input.is_action_just_pressed.

## Repro steps:

Press Enter to see the pink color, and watch it return to gray.
Press Space to toggle to fullscreen.
Press Enter to see the pink color again after only one keypress.
Press Space once.
Note that the mode does not toggle back to windowed.
Press Space a second time.
Now the display returns to windowed mode.

## Suspicions:

Based on the behavior, I'm imagining that triggering the display mode change interupts some code that would normally reset the input back to an unpressed state. This appears to be specific to macOS as far as I've seen so far, as I cannot reproduce it on Windows.
