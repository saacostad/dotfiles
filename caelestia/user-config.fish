# -- To make range behave prettily
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
	source ~/.config/fish/config.fish
end

function r
	ranger $argv
end


# -- To liberate RAM
function freeram
	command sudo sync && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
end




# -- To make KITTY have good colors
if set -q KITTY_WINDOW_ID
	kitten @ set-colors --all --configured ~/.config/kitty/current-theme.conf
end




# -- To set-up python enviroments
# Default env the first time fish starts
if not set -q ACTIVE_PY_ENV
	set -U ACTIVE_PY_ENV p314
end

# Auto-activate shared env
if test -f ~/.venvs/$ACTIVE_PY_ENV/bin/activate.fish
	source ~/.venvs/$ACTIVE_PY_ENV/bin/activate.fish
end

function change_pyenv
    # Automatically get env names from ~/.venvs
    set -l envs (ls ~/.venvs)

    set -l n (count $envs)

    # Current env
    set -l current (basename "$VIRTUAL_ENV")

    # Default next index
    set -l next_index 1

    # Find current env
    for i in (seq $n)
        if test "$envs[$i]" = "$current"
            set next_index (math "($i % $n) + 1")
            break
        end
    end

    set -l next_env $envs[$next_index]

    # Deactivate previous env if active
    if functions -q deactivate
        deactivate
    end

    # Share active env across all fish sessions
    set -U ACTIVE_PY_ENV $next_env

    # Activate new env
    source ~/.venvs/$next_env/bin/activate.fish

    echo "Activated: $next_env"
end
