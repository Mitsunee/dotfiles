# PNPM Autocompletion

Autocompletion for bash requires separate installation:

```shell
mkdir -p "$XDG_CONFIG_HOME/bash"
pnpm completion bash > "$XDG_CONFIG_HOME/bash/completion-for-pnpm.bash
```
See https://pnpm.io/completion for more information

Note: The file needs to be sourced for auto-completion to work, this is automatically achieved in [.bashrc](../dotfiles/.bashrc)
