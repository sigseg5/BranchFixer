
# --------------- BranchFixer ---------------
# --------------- version 0.1 ---------------

branch_edit() {
    op_type=$1
    executed_command=$2

    branches=$(git branch --list | cut -c 3-)

    found_master=false
    found_main=false

    while IFS= read -r branch_name; do
        if [[ "$branch_name" == "master" ]]; then
            found_master=true
        elif [[ "$branch_name" == "main" ]]; then
            found_main=true
        fi
    done <<<"$branches"

    if $found_master; then
        git "$op_type" master
    fi

    if $found_main; then
        git "$op_type" main
    fi

    if ! $found_master && ! $found_main; then
        echo "bash: main/master branches not found for command: ${executed_command}"
        return 1
    fi
}

branch_fixer() {
    local exit_code=$?

    # Retrieve the executed command using the history mechanism
    local executed_command=$(history 1 | sed 's/^[[:space:]]*[0-9]*[[:space:]]*//')

    if [[ $exit_code != 0 ]]; then

        # Split the string based on whitespace
        IFS=' ' read -ra strarr <<<"$executed_command"

        # Print each value of the array by using a loop
        for element in "${strarr[@]}"; do
            if [[ $element == "git" ]]; then
                case "$executed_command" in
                *switch*)
                    branch_edit "switch" "$executed_command"
                    branch_edit_exit_code=$?
                    if [[ $branch_edit_exit_code -eq 0 ]]; then
                        echo "Corrected branch for git switch!"
                    fi
                    ;;
                *checkout*)
                    branch_edit "checkout" "$executed_command"
                    branch_edit_exit_code=$?
                    if [[ $branch_edit_exit_code -eq 0 ]]; then
                        echo "Corrected branch for git checkout!"
                    fi
                    ;;
                *merge*)
                    branch_edit "merge" "$executed_command"
                    branch_edit_exit_code=$?
                    if [[ $branch_edit_exit_code -eq 0 ]]; then
                        echo "Corrected branch for git merge!"
                    fi
                    ;;
                *rebase*)
                    branch_edit "rebase" "$executed_command"
                    branch_edit_exit_code=$?
                    if [[ $branch_edit_exit_code -eq 0 ]]; then
                        echo "Corrected branch for git rebase!"
                    fi
                    ;;
                *log*)
                    branch_edit "log" "$executed_command"
                    branch_edit_exit_code=$?
                    if [[ $branch_edit_exit_code -eq 0 ]]; then
                        echo "Corrected branch for git log!"
                    fi
                    ;;
                *) ;;
                esac
            fi
        done
    fi
}

PROMPT_COMMAND=branch_fixer

# --------------- BranchFixer ---------------
