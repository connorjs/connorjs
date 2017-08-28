# My customization for powerlevel9k prompt
POWERLEVEL9K_MODE='nerdfont-complete'

# Custom segments
POWERLEVEL9K_CUSTOM_ITERM2_PROMPT_MARK="iterm2_prompt_mark"

# Prompt segment lists (elements)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    custom_iterm2_prompt_mark
    root_indicator
    os_icon
    ssh
    dir
    vcs
    dir_writable
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time
    background_jobs
    battery
    time
)

# Prompt styling
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true  # newline between commands
POWERLEVEL9K_PROMPT_ON_NEWLINE=true  # newline after prompt
# I want a newline between commands (above). However, I also want iTerm2's
# mark feature (shell integration). To get everyone playing together nicely,
# we set the background color of the mark to none (something invalid). This
# results in the background color of the terminal (visually showing blank).
POWERLEVEL9K_CUSTOM_ITERM2_PROMPT_MARK_BACKGROUND='none'
# So, we _do not_ add a newline because the mark is already adding the newline.
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false  # turn off for iTerm2
# We also forfeit the ability to use POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR 
# because this is put between the mark and the next segment. Maybe it would
# look fine with the right separator, but I have removed it (below in icons).

# Color scheme
POWERLEVEL9K_COLOR_SCHEME='light'

# Directory
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_folder_marker"
# Match idea project roots (.git is a common alternative)
POWERLEVEL9K_SHORTEN_FOLDER_MARKER='.idea'  

# Execution time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=30

# Time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %Z}"  # include timezone!

# Battery - See https://github.com/bhilburn/powerlevel9k#battery
POWERLEVEL9K_BATTERY_VERBOSE=false  # Display time remaining next to battery level.
# Stages instead of icon
BATTERY_STAGES_5=('' '' '' '' '')
BATTERY_STAGES_40=(
	"▏    ▏" "▎    ▏" "▍    ▏" "▌    ▏" "▋    ▏" "▊    ▏" "▉    ▏" "█    ▏"
	"█▏   ▏" "█▎   ▏" "█▍   ▏" "█▌   ▏" "█▋   ▏" "█▊   ▏" "█▉   ▏" "██   ▏"
	"██   ▏" "██▎  ▏" "██▍  ▏" "██▌  ▏" "██▋  ▏" "██▊  ▏" "██▉  ▏" "███  ▏"
	"███  ▏" "███▎ ▏" "███▍ ▏" "███▌ ▏" "███▋ ▏" "███▊ ▏" "███▉ ▏" "████ ▏"
	"████ ▏" "████▎▏" "████▍▏" "████▌▏" "████▋▏" "████▊▏" "████▉▏" "█████▏")
POWERLEVEL9K_BATTERY_STAGES=($BATTERY_STAGES_5)
# Background color 
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(196 202 208 214 220 226 190 154 118 82 46)
# Foreground colors all the same (I don't care for the provided states)
BATTERY_FOREGROUND='black'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=$BATTERY_FOREGROUND

# Icons                                          # DEFAULTS
POWERLEVEL9K_BATTERY_ICON='🔋'                    # 
POWERLEVEL9K_FOLDER_ICON=''                      # 
POWERLEVEL9K_HOME_ICON=''                        # 
POWERLEVEL9K_HOME_SUB_ICON=''                    # 
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''       #
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''          # 
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''        #    # Would be '' if no iTerm mark issue
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''    # ╭─
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''  # ├─
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=' > '  # ╰─ # use leading space because iTerm mark
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''         # 
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''      # 
POWERLEVEL9K_ROOT_ICON='⚡️'                       # 
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='black'   # ?  # works nicely with ⚡️
POWERLEVEL9K_VCS_GIT_ICON=''                    # 
