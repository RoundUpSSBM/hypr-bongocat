# hypr-bongocat

A tiny Hyprland plugin that draws a bongo cat on your window that taps while you type!

## Demo
[📽️ Demo video](https://github.com/user-attachments/assets/b9b67a34-88ff-4fdb-bc84-cb4c047ac0ff)

## Installation
### Requirement
- Newest Hyprland.
- Cmake and a C++ compiler. (usually already builtin if you use hyprland) 

### Install with hyprpm
```bash
hyprpm add https://github.com/roundupssbm/hypr-bongocat
hyprpm enable hypr-bongocat
```

### Build from source
```bash
git clone https://github.com/roundupssbm/hypr-bongocat
cd hypr-bongocat
make load
```
To manually load/unload:
```bash
hyprctl plugin load /dir/to/hypr-bongocat.so
hyprctl plugin unload /dir/to/hypr-bongocat.so
```
change load to unload to remove the plugin

## Config

```hyprland.lua
hl.config({
    plugin = {
        hypr-bongocat = {
            -- can be from -1 to 1, will be
                -- dynamic ratio with the window instead.
                -- recommend fixed size for image as dynamic can look weird
                -- leave one as 0 to keep original image ratio (image only)
            -- width, height
            size = { 125, 0 },

            -- shift down right (can be from -1 to 1, similarly)
            pos = { 0, -39 },

            --0: left/top, 1: middle, 2: down/right
            origin = { 1, 0 },

            -- path to a directory with both.png, left.png, right.png
            -- Absolute path is needed (~ for home directory is fine)
            -- default directory when installing with Hyprpm:
            imgs = "~/.config/hypr/hypr-bongocat/bongo",

            -- can also exclude specific windows!
            -- exclude = "kitty, firefox",
        }
    }
})
```

config options:
| Config value | Format | Default value | Notes |
| :--- | :--- | :--- | :--- |
| size | {x, y} | {125, 0} | between -1 and 1: dynamic ratio of window, otherwise absolute|
| pos | {x, y} | {0, -39} | between -1 and 1: relative to window, otherwise absolute|
| origin | {x, y} | {1, 0} | 0: left/top, 1: middle, 2: down/right|
| exclude | "firefox, kitty" | "" | comma and/or space separated |
| imgs | "/path/to/dir" | "~/.config/hypr/hypr-bongocat/bongo" | for bongocats. must be a directory with "left.png", "right.png", "none.png", "both.png" |
| img | "/path/to/img" | "" | for single image. |
| color | "rgba(RRGGBBAA)" | "rgba(FFDD33FF)" |  
| rounding | "x" | 4.0 | rounding of dot if no image is selected |

## Contribute
PRs are welcome!

## Credits
[Original project by PohlRabi404](https://github.com/pohlrabi404/Hyprfoci)
