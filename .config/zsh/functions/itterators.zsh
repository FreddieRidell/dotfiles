function vimovergrep {
	echo "vimovergrep is a work in progress"
	echo "$1"
	echo "$2"
}

function freddieFixFormat {
	for f in $( yarn run format | grep \"/home/freddie\" ) ; do vim $f ; done
}

function openXinY {
	ag -l "$1" "$2"
	ag -l "$1" "$2" | xargs -n 1 nvim -c "silent! /$1"
}

function findReplaceIn {
  ag -l $1 $3 | xargs -n 1 -I '{}' sed --in-place '{}' -e "s/$1/$2/g" 
}

function vimFileAndTest {
  file="$1"
  testDir="$(dirname "$1")/__tests__"
  testFile="$(basename "$1")"
  testPath="$testDir/$( echo $testFile| sed -e "s/\.js/\.spec\.js/" )"
  vim -O $file $testPath
}

function vimFilesAndTests {
  for x in $@ ; do
    file=$x
    testDir="$(dirname "$x")/__tests__"
    testFile="$(basename "$x")"
    testPath="$testDir/$( echo $testFile| sed -e "s/\.js/\.spec\.js/" )"
    vim -O $file $testPath
  done
}
