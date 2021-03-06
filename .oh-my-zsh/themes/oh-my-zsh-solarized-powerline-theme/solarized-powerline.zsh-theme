
# OS detection
if [ -n "${OS+x}" ]; then
	OS=$(uname)
fi

# color
BG_COLOR_BLACK=%{$bg[black]%}
BG_COLOR_BLUE=%{$bg[blue]%}
BG_COLOR_GREEN=%{$bg[green]%}
BG_COLOR_CYAN=%{$bg[cyan]%}


BG_COLOR_0=%K{0}
BG_COLOR_1=%K{1}
BG_COLOR_2=%K{2}
BG_COLOR_3=%K{3}
BG_COLOR_4=%K{4}
BG_COLOR_5=%K{5}
BG_COLOR_6=%K{6}
BG_COLOR_7=%K{7}
BG_COLOR_8=%K{8}
BG_COLOR_9=%K{9}
BG_COLOR_10=%K{10}
BG_COLOR_11=%K{11}
BG_COLOR_12=%K{12}
BG_COLOR_13=%K{13}
BG_COLOR_14=%K{14}
BG_COLOR_15=%K{15}

FG_COLOR_BLACK=%{$fg[black]%}
FG_COLOR_RED=%{$fg[red]%}
FG_COLOR_GREEN=%{$fg[green]%}
FG_COLOR_BLUE=%{$fg[blue]%}
FG_COLOR_YELLOW=%{$fg[yellow]%}
FG_COLOR_CYAN=%{$fg[cyan]%}
FG_COLOR_WHITE=%{$fg[white]%}

FG_COLOR_0=%F{0}
FG_COLOR_1=%F{1}
FG_COLOR_2=%F{2}
FG_COLOR_3=%F{3}
FG_COLOR_4=%F{4}
FG_COLOR_5=%F{5}
FG_COLOR_6=%F{6}
FG_COLOR_7=%F{7}
FG_COLOR_8=%F{8}
FG_COLOR_9=%F{9}
FG_COLOR_10=%F{10}
FG_COLOR_11=%F{11}
FG_COLOR_12=%F{12}
FG_COLOR_13=%F{13}
FG_COLOR_14=%F{14}
FG_COLOR_15=%F{15}

FG_COLOR_228=%F{228}
# reset color
reset_color=%f%k%b
RESET=%{$reset_color%}


GIT_DIRTY_COLOR=%F{196}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX="  "
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✔"

ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

ZSH_TIME=%T

# username

PROMPT="
$FG_COLOR_4$BG_COLOR_7 %n"

# hostname
IP=`curl -si --max-time 2 http://ipecho.net/plain`

if [ "$(echo $IP | grep 200)" = "" ]; then
	# no network connection, use hostname
	IP="%m"
else
	# replace dot by dash
	IP=`echo -n $IP | tail -n 1 | sed "s/\./-/g"`
fi

PROMPT=$PROMPT"$FG_COLOR_2 at$FG_COLOR_13 $IP "

PROMPT=$PROMPT"$FG_COLOR_7$BG_COLOR_10"$''

# datetime
PROMPT=$PROMPT"$FG_COLOR_7$BG_COLOR_10 $ZSH_TIME "

PROMPT=$PROMPT"$FG_COLOR_10$BG_COLOR_0"$''

if [ $OS = "Darwin" ]; then
	LOGO=""
else
	LOGO="🐧"
fi

# current directory (%E hightline all line to end)
PROMPT=$PROMPT"$FG_COLOR_15$BG_COLOR_0 $LOGO %2~"$'$(git_prompt_info)'" %E
  "

PROMPT=$PROMPT"$FG_COLOR_0$BG_COLOR_8"$''

# resrt
PROMPT=$PROMPT"$RESET "

local return_code="%(?..$FG_COLOR_RED%? ↵$RESET)"
RPROMPT="${return_code}"

