#!/bin/sh
. $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf nodejs update-nodebuild

asdf install nodejs lts
asdf global nodejs lts

asdf plugin add python https://github.com/asdf-community/asdf-python
asdf install python latest:3.10
asdf install python latest:2
asdf global python latest:3.10 latest:2
asdf reshim
