# Manjaro configurations

## 00-keyboard.conf
触摸板配置

## 2e26f6
bumblebee=status 版本号， 此版本工作正常，后续版本由于作者减少了依赖， 产生了新的bug，不知道后续有没有修复，如果存在问题，git reset到这个版本就好了。

## greyish-powerline.json
bumblebee-status 主题文件 相较于原文件略有改动

## i3config
i3 的配置文件，依赖 rofi，feh， bumblebee-status

## pacman.conf
配置了一个合理的archlinuxcn源

## tmux.conf
tmux 配置文件， 主要是使用Alt/Esc+9/0来进行上下和左右的移动

## vimrc
安装vim-plug之后，覆盖此文件为vim的默认配置文件，然后执行插件更新就可以使用了，也许字体会在Vscode的终端里面表现不好，字体作者为vscode设计了特殊的字体，需要去进一步的搜索
