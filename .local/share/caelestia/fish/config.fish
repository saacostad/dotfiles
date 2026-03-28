if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'
    # Add to ~/.config/fish/config.fish
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'
    




    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
    
    # Custom fish config
    # source ~/.config/caelestia/user-config.fish 2> /dev/null

	function ranger
	    set tempfile (mktemp -t ranger_cd.XXXXXX)
	    command ranger --choosedir=$tempfile $argv
	    if test -f $tempfile
		set dir (cat $tempfile)
		if test -d "$dir"
		    cd "$dir"
		end
	    end
	    rm -f $tempfile

	    tput sgr0
	    commandline -f repaint
	end
    
    function nvim
        command nvim $argv
	source ~/.config/fish/config.fish
    end

    function r
      ranger $argv
    end
end

# Add to ~/.config/fish/config.fish
if not set -q SSH_AGENT_PID
    eval (ssh-agent -c) > /dev/null
end

# Created by `pipx` on 2026-03-25 21:45:40
set PATH $PATH /home/santiago/.local/bin
source ~/.venvs/p39/bin/activate.fish
set -x QT_QPA_PLATFORM xcb
