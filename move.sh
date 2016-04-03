TMPDIR=`mktemp -d`

cp $2 `dirname $2`/backup.sav
cat $1 | base64 --decode > $TMPDIR/src_decoded
cat $2 | base64 --decode > $TMPDIR/dst_decoded
dd count=60 if=$TMPDIR/dst_decoded of=$TMPDIR/dst_header bs=1 >& /dev/null
dd skip=60 if=$TMPDIR/src_decoded of=$TMPDIR/body bs=1 >& /dev/null
cat $TMPDIR/dst_header $TMPDIR/body > $TMPDIR/modified
cat $TMPDIR/modified | base64 > $2
