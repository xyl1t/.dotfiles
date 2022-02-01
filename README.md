# My dotfiles

Dotfiles mostly for [neovim], [fish] and [tmux]

Current color scheme of choice: [gruvbox]

Other color schemes:
 * [Cattpucin]
 * [Onedark]
 * Monokai
   * [Sonokai] for nvim
   * [One Monokai] and [Monokai Pro] for VS code

Fonts:
 * [Terminus]
   * For mac: [Terminus ttf]
 * [Cozette]
 * Various [Nerd Fonts] for icons

## Screenshots

![fish](./terminal.png)

![vim1](./vim.png)

![vim2](./vim2.png)

## Installation

If you are me or really like my dotfiles and want to install them,
you will need GNU stow, once installed, follow these steps[^1]:

```sh
# clone repo
git clone https://github.com/xyl1t/.dotfiles.git
cd .dotfiles
# install dotfiles
stow -vt ~ */
```
[^1]: Assuming you are on macOS/Linux

[neovim]: https://neovim.io/
[fish]: https://fishell.com
[tmux]: https://github.com/tmux/tmux/wiki
[gruvbox]: https://github.com/morhetz/gruvbox
[Cattpucin]: https://files.ax86.net/terminus-ttf/
[Onedark]: https://github.com/navarasu/onedark.nvim
[Sonokai]: https://github.com/sainnhe/sonokai
[One Monokai]: https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai
[Monokai Pro]: https://monokai.pro/vscode
[Monokai for nvim]: https://github.com/sainnhe/sonokai
[Terminus]: http://terminus-font.sourceforge.net/
[Terminus ttf]: https://files.ax86.net/terminus-ttf/
[Cozette]: https://github.com/slavfox/Cozette
[Nerd Fonts]: https://www.nerdfonts.com/

