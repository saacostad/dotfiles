if status is-interactive

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'
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

    # Ranger with cd on exit
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

    # Nvim with cd on exit
    function nvim
        set tempfile (mktemp -t nvim_cd.XXXXXX)
        command nvim --cmd "autocmd VimLeave * call writefile([getcwd()], '$tempfile')" $argv
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

    function r
        ranger $argv
    end

    # Python venv (skip inside nvim terminal to avoid prompt error)
    if test -e ~/.venvs/p39/bin/activate.fish; and not set -q NVIM
        source ~/.venvs/p39/bin/activate.fish
    end

    # Fix colors inside nvim terminal
    if set -q NVIM
        set -gx TERM xterm-256color
        set -gx COLORTERM truecolor
    end

    # Starship prompt (MUST be last)
    starship init fish | source
end

# SSH agent (runs in all shells, not just interactive)
if not set -q SSH_AGENT_PID
    eval (ssh-agent -c) > /dev/null
end

# PATH
set -gx PATH $PATH /home/santiago/.local/bin

# Qt platform
set -gx QT_QPA_PLATFORM xcb
