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
