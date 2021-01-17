function cabalCabal { cabal --key cabal://7d99b453506b9743bf5e71fe749f66c814d7cd9388a5d394a27eed4c5640302b --nick freddieRidell } 
function cabalDUCSGS { cabal --key dat://88a978f3ce3bd7c7e9aecfc4bf19d34b2ae44b0e2356c295a995163cd3aa2e9e --nick freddieRidell } 
function cdtmux { cd $1 ; tmux new -s $1 } 
function chpwd { title "$( getFolder )" } 
function coresCount { getconf _NPROCESSORS_ONLN }
function cortexRepair { for x in $( cortex diff --name-only --diff-filter=U ) ; do ; vim $x ; cortex add $x ; cortex rebase --continue; done }
function createSSHableUser { useradd $1 ; usermod -aG sudo $1 ; rsync --archive --chown=$1:$1 ~/.ssh /home/$1 }
function findAndReplaceInFolder { ag --nocolor -l $1 | xargs sd -i $1 $2 }
function findPretty() { for FILE_NAME in $( ag --nocolor -l $1 ) ; do ; scriptMsg $FILE_NAME ; bat --color always --decorations always $FILE_NAME | ag --color $1 -C ${2:-2} ; done | less -R }
function getFolder () { echo ${PWD:t} } 
function gitBranchify { git checkout -b "$1-$( echo "${@:2}" | sed -e "s/[^a-zA-Z0-9]/-/g" -e "s/--*/-/g" -e "s/-$//g" | tr '[:upper:]' '[:lower:]' )" }
function gitCheckoutSearch { git branch | ag "$@" | strip-ansi | xargs -n 1 git checkout }
function gitCommitRedmine() { git commit -m "[RM-$(gitCurrentBranch | sed -e "s/[^0-9]*\([0-9]\+\).*/\1/")] $*" }
function gitCurrentBranch { git symbolic-ref -q --short HEAD }
function gitCurrentHash { git rev-parse HEAD }
function gitDiffList { git rev-list --oneline $( git merge-base $1 HEAD )...HEAD | tail -r | while read LINE ; do echo "+ $LINE" ; done }
function gitGetConflicts() { git diff --name-only --diff-filter=U }
function gitPoke { git commit --amend --date="now" --no-edit > /dev/null ; git rev-parse HEAD } 
function gitPushCommitAsThisBranch { CURRENT_HASH="$( gitCurrentHash )" ; git reset --hard $1 ; git push ; git reset --hard $CURRENT_HASH ; }
function gitResetToOrigin { git reset --hard "origin/$( gitCurrentBranch )" } 
function gitRid { git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done } 
function gitStatusSorted { git status | sort | ag --nocolor .\+ --no-color } 
function isoDate { date +"%Y-%m-%d" } 
function isoTime { date +"%Y-%m-%d %H:%M:%S" }
function jqModify { TMP_FILE_NAME="/tmp/$RANDOM.json" && jq $1 $2 > $TMP_FILE_NAME && mv $TMP_FILE_NAME $2 } 
function largestFile { wc -l "$@" | sort -nr -t":" -k1 | head -2 | tail -1 | sed -e 's/[0-9]\+//' }
function lesss { cats $1 | less -r } 
function lock { ~/.i3/lock.sh } 
function openXinY { ag -l "$1" "$2" ; ag -l --nocolor "$1" "$2" | xargs -n 1 nvim -c "silent! /$1" } 
function osxNotification { osascript -e "display notification \"$2\" with title \"$1\"" }
function printAndEval() { scriptMsg $@ ; $@ } 
function randomHex { echo $RANDOM | xargs printf "%x\n" }
function reactLifecycleCheatsheet { bat ~/.config/cheatsheets/react.md }
function rpn { dc -f ~/.dcrc - <<< "$* f" }
function s3rmb { aws s3 rm --recursive "s3://$1"  && aws s3 rb "s3://$1" }
function scriptMsg() { echo "\e[1;32;40m# $@ \e[0;37;40m" } 
function sleepo { systemctl suspend } 
function snippetLoad { SNIPPET=`cat ~/.snippets | fzf` ; print -z $SNIPPET }
function snippetSave { tail -n 2 ~/.zsh_history | head -n 1 | cut -d ';' -f 2- >> ~/.snippets && config add ~/.snippets && config commit -m "added snippet" }
function taskAddScriptable { echo $@ ; task add $@ &> /dev/null ; task +LATEST export | jq ".[0].uuid" -r }
function taskAddScriptable { task add $@ &> /dev/null ; task +LATEST export | jq ".[0].uuid" -r }
function title { echo -ne "\033]0;${1}\007" } 
function tmuxCheatSheet { curl https://gist.githubusercontent.com/MohamedAlaa/2961058/raw/ddf157a0d7b1674a2190a80e126f2e6aec54f369/tmux-cheatsheet.markdown | $CATTER --language markdown }
function unixTime { date +%s ; } 
function yarnClearLink { yarn unlink $1 && rm -rf node_modules && yarn install }
