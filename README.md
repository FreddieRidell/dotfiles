# dotfiles
My dotfiles, moved here after dropbox fucked the whole thing up -_-

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) nifty little blog post

```shell
sh -c "$(wget https://raw.githubusercontent.com/CodogoFreddie/dotfiles/master/.setupDotfiles.sh -O -)"
```

## Issues:
- [x] version 0.1 of custom prompt
- [ ] branch displaying in detached head state
- [ ] git prompt status with ascii markers:
  - [ ] new (un)committed
  - [ ] modified (un)committed
  - [ ] deleted (un)committed
  - [ ] behind/infront of origin for this branch
  - [ ] behind/infront of master for this branch
- [ ] `RPROMPT` sodded up on OSX iTerm
