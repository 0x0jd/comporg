DIR=$HOME/git/comporg/$1
TEMPLATE=$HOME/git/comporg/template/
if [ ! -d "$DIR" ]; then
	mkdir $DIR
	cp $TEMPLATE/temp.s $DIR/$1.s
	cp $TEMPLATE/lib.asm $DIR/
	cat $TEMPLATE/Makefile | sed "s/XX/$1/g" > $DIR/Makefile
	echo -e "Successfully created $1!"
else
	echo -e "Directory Exists!\n"
fi
