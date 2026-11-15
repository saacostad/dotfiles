# Add Homebrew binaries to PATH for GUI-launched sessions
fish_add_path /opt/homebrew/bin
set fish_greeting
export EDITOR="nvim"

if status is-interactive
    source (pyenv init -|psub)
    # Commands to run in interactive sessions can go here
    # -- Use yazi instead of ranger
	function yazi
	    set tempfile (mktemp -t yazi_cwd.XXXXXX)
	    command yazi $argv --cwd-file="$tempfile"
	    if test -f "$tempfile"
		set dir (cat "$tempfile")
		if test -n "$dir" -a -d "$dir"
		    cd "$dir"
		end
	    end
	    rm -f "$tempfile"
	end

	function r
	    yazi $argv
	end

	function t 
		tmux 
	end 

	function n
		nvim $argv
	end

end

starship init fish | source
