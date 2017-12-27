##################################
# Actual Command Prompt Definition 
##################################

# Left prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    custom_iterm2_prompt_mark
    root_indicator
    os_icon
    ssh
    dir
    vcs
    dir_writable
)
# Right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time
    background_jobs
    battery
    time
)

############
# Aesthetics
############

# Color Scheme
# We are using Solarized Light for terminal colors, so use 'light' here
POWERLEVEL9K_COLOR_SCHEME='light'

# Prompt Styling
# (1) Add newline between commands
# (2) Add newline after the command prompt
# (3) Fix shell integration with newlines (see detailed comment)†
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true # (1)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true  # (2) 
POWERLEVEL9K_CUSTOM_ITERM2_PROMPT_MARK_BACKGROUND='none' # (3)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false  # (3)
# † (detailed comment on fixing shell integration and newlines)
#
# I want a newline between commands (1).
# However, I also want iTerm2's mark feature (shell integration).
# So, to get everyone playing together nicely, we set the background color of
# the mark to 'none' (anything invalid), (3). This results in the background 
# color of the terminal (visually showing blank).
# The mark itself has its own newline, so we _do not_ add a newline (3) - this
# renders (1) not needed, but we leave it in case this hack fix is not needed.
#
# We also forfeit the ability to use POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR 
# because this is put between the mark and the next segment. Maybe it would
# look fine with the right separator, but I have removed it (below in icons).

# Customize general icons and variables
# Icon Name                                           # Default Value
POWERLEVEL9K_BATTERY_ICON='🔋'                         # \uf240 
POWERLEVEL9K_FOLDER_ICON=''                           # \uf115 
POWERLEVEL9K_HOME_ICON=''                             # \uf015 
POWERLEVEL9K_HOME_SUB_ICON=''                         # \uf07c 
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''            #
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\ue0c8' #       # \ue0b0 
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''             # \ue0b1   # Would be '\ue0bb' ('') if no iTerm mark issue
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''         # ╭─
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''       # ├─
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=' > '       # ╰─
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\ue0c7' #      # \ue0b2 
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\ue0b9' #   # \ue0b3 
POWERLEVEL9K_ROOT_ICON='⚡️'                            # 
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='black'        # works nicely with ⚡️
POWERLEVEL9K_VCS_GIT_ICON='\ue702' #                 # \ue708 

#################
# Custom Segments
#################

function iterm_marker() {
  # This is a workaround for iTerm2 < 3.1, TODO: Remove when 3.1 is officially released
  # check for existence b/c marker is 3.1+
  # if not present, preserve the implicit newline (see lower for more details)
  # "\n" by itself does not have the segment separator (space), hence " \u008"
  declare -f iterm2_prompt_marks && iterm2_prompt_marks || echo "\n \u008"
}
POWERLEVEL9K_CUSTOM_ITERM2_PROMPT_MARK="iterm_marker"

#############################
# Customize Existing Segments
#############################

# Segment: dir
# (1) Truncate
# (2) Match idea project roots (.git is a common alternative)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_folder_marker"
POWERLEVEL9K_SHORTEN_FOLDER_MARKER='.idea'  

# Segment: command_execution_time
# Only show if the previous command took longer than 30 seconds
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=30

# Segment: time
# Update to include the timezone. Example: `01:23:45 PST`
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S %Z}'

# Segment: battery (see https://github.com/bhilburn/powerlevel9k#battery)
# (1) Display time remaining next to battery level
# (2) Set background color based on battery level
# (3) Set foreground colors all the same (I don't care for the provided states)
# (4) Set the symbols based on battery level
POWERLEVEL9K_BATTERY_VERBOSE=false # (1)
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(196 202 208 214 220 226 190 154 118 82 46) # (2)
BATTERY_FOREGROUND='black' # (3)
POWERLEVEL9K_BATTERY_LOW_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=$BATTERY_FOREGROUND
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=$BATTERY_FOREGROUND
# (4) - Be fancy with the `buildIconArray` function
() {
  # Local variables for types of batteries 
  local e='\uf244' # _e_mpty 
  local o='\uf243' # _o_ne quarter 
  local h='\uf242' # _h_alf 
  local t='\uf241' # _t_hree quarters 
  local f='\uf240' # _f_ull 
  
  # Use `buildIconArray` to customize battery stages
  # Example: `buildIconArray 4 $e $f` would set ('' '' '' '' '')
  BATTERY_NUMBER_OF_PRINTED_ICONS=4
  BATTERY_ICONS=($e $o $h $t $f)
  # Note: We use variables instead of calling `buildIconArray` directly b/c
  # we want the customization here, before the (verbose) function definition
}
buildIconArray() {
  # $1 - printed_length (integer) - the number of icons to print (e.g. 4)
  # $2 - states (array of string) - the possible icons, ordered (e.g. (□ ■))
  # Note: no type validation is performed on the input

  # Assign the parameters
  local printed_length=$1
  shift 1
  local states=($@)
  local states_length=${#states[@]}

  # Handle single state case
  if [[ $states_length -eq 1 ]]; then
    local icon_string=""
    for i in $(seq 0 $printed_length); do icon_string+=$states[1]; done
    echo $icon_string
    return
  fi

  # Remember empty and local states
  local empty_state=$states[1]
  local filled_state=$states[-1]

  # Initialize return value
  local icon_array=()

  # Stateful loop variables
  local middle_index=1  # index pointing to the position which is "being filled"
  local current_icon_state_index=1

  while [[ $middle_index -le $printed_length ]]; do
    # Initial values
    local icon_string=""
    local current_index=1

    # Prefill with "filled" icons
    while [[ current_index -lt $middle_index ]]; do
      icon_string+=$filled_state
      ((++current_index))
    done

    # Add the current icon and increment, updating the `middle_index` if needed
    icon_string+=$states[$current_icon_state_index]
    ((++current_index))
    ((++current_icon_state_index))
    if [[ $current_icon_state_index -gt $states_length ]]; then
      current_icon_state_index=1
      ((++middle_index))
    fi

    # Pad the rest with "empty" icons
    while [[ current_index -le $printed_length ]]; do
      icon_string+=$empty_state
      ((++current_index))
    done

    # Add built icon string to return value
    icon_array+=$icon_string
  done

  POWERLEVEL9K_BATTERY_STAGES=($icon_array)
}
() { buildIconArray $BATTERY_NUMBER_OF_PRINTED_ICONS $BATTERY_ICONS }

