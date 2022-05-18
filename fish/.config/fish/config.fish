if status is-interactive
    # Commands to run in interactive sessions can go here
end

# SETTINGS
export VISUAL=nvim
export EDITOR="$VISUAL"
export JDTLS_HOME=~/.local/share/nvim/lsp_servers/jdtls # Directory with the plugin and configs directories

# ALIASES
switch (uname)
case Darwin
	alias code 'open -a "Visual Studio Code"'
	alias subl 'open -a "Sublime Text"'
	alias aplay "mplayer -cache 1024 -quiet -rawaudio samplesize=1:channels=1:rate=8000 -demuxer rawaudio -"
	alias find gfind
end

alias src_fconf "source ~/.config/fish/config.fish"
alias vim "nvim"
alias ls 'exa -lF --color=always --group-directories-first'
alias ll 'exa -alF --color=always --group-directories-first'
alias lt 'exa -aTF --color=always --group-directories-first'
alias l. 'exa -lF --color=always --group-directories-first -d .*'
alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'
# alias ls 'ls -GFh'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'
# alias nvimrc 'nvim ~/.config/nvim/init.vim'
alias vrc  "vim -c ':cd ~/.config/nvim' -c ':Bdelete' -c ':Alpha'"
alias fconf "vim -c ':cd ~/.config/fish' -c ':e config.fish'"
alias e nvim
alias lg lazygit
alias ncdu "ncdu --color dark"
alias youtube-dl-audio "youtube-dl --extract-audio --audio-format mp3"

switch (uname)
case Darwin
	set PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
	export PATH
	# source ~/Home/Documents/Programming/C++/clones/emsdk/emsdk_env.fish
	source ~/.iterm2_shell_integration.fish

	fish_add_path /usr/local/sbin
end

# this is makes it so that ctrl+f works in vi mode
function fish_user_key_bindings
	fish_vi_key_bindings
	bind -M insert \cf accept-autosuggestion
	bind \cf accept-autosuggestion
	bind -M insert \cp history-search-backward
	bind \cp history-search-backward
	bind -M insert \cn history-search-forward
	bind \cn history-search-forward
	bind -M insert \el 'clear; commandline -f repaint'
	bind \el 'clear; commandline -f repaint'
	bind -M insert \ca beginning-of-line
	bind \ca beginning-of-line
	bind -M insert \ce end-of-line
	bind \ce end-of-line
end

function fish_greeting

pfetch
end

# misc
# bat theme
set -xU BAT_THEME gruvbox-dark
