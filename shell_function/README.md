# shell_function

A mason brick for creating zsh/shell functions.

If you need help adding the generated function to your `PATH` see [this AskUbuntu answer][ask].

I use ZSH so I am able to place all my functions in a static directory (I use `~/.zshfn/` to store all of my functions) and in the bottom of my `~/.zshrc` file I have the following:

```zshrc
fpath=( ~/.zshfn "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)
```

Check out this [StackExchange answer][stack] for more info

[ask]: https://askubuntu.com/a/344560
[stack]: https://unix.stackexchange.com/a/33898