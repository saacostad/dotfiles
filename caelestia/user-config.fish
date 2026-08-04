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

function freeram
	command sudo sync && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
end
	
if set -q KITTY_WINDOW_ID
	kitten @ set-colors --all --configured ~/.config/kitty/current-theme.conf
end
