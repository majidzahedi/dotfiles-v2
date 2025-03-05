if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

# pnpm
set -gx PNPM_HOME "/home/majid/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

function my-zen-init --on-event zen.init
    zen tmux new-window nvim
end

set -gx ATUIN_NOBIND "true"
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search

direnv hook fish | source
