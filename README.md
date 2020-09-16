# ubuntu-pinch-to-zoom
A little script that take advantage of the magnifier lens function provided by gnome to reproduce pinch-to-zoom on linux.
## Requirements
this script require bc installed and gsetting.

> apt-get install bc

## Usage
It take only one argument, the vualue to add at current magnify factor; it can be a float, also negative for reduce the magnification.
However the magnify factor will never decrese under 1.0; when this value is reached the magnify lens is disabled.

### Gesture
If you want you can bid it with a gesture of the touchpad; for this is needed an engine suc as lib-input-gestures or fusuma.
