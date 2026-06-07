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
