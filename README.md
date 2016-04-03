# hld-save-utils
Save game utilities for Hyper Light Drifter. Allows for saves to be modified or moved between computers.

Information on encoding found [here](http://steamcommunity.com/app/257850/discussions/0/365163537818010599/)

## Edit

```shell
./edit.sh <save>
```

Temporarily decode a save then open for editing in `vi`. After modifications are made, re-encodes and saves back to the same file. Prior to editing, saves the input into `backup.sav`.

## Move

```shell
./move.sh <src> <dst>

Move a save from one computer to another. The `<src>` is the save to move and the `<dst>` argument must be a valid save from the destination computer. The destination argument is overwritten during this operation, but is first copied into `backup.sav`.
