TMPDIR=`mktemp -d`

mkdir -p $TMPDIR
cp $1 `dirname $1`/backup.sav
cat $1 | base64 --decode > $TMPDIR/decoded
dd count=60 if=$TMPDIR/decoded of=$TMPDIR/header bs=1 >& /dev/null
dd skip=60 if=$TMPDIR/decoded of=$TMPDIR/body bs=1 >& /dev/null
vi $TMPDIR/body
cat $TMPDIR/header $TMPDIR/body > $TMPDIR/modified
cat $TMPDIR/modified | base64 > $1
