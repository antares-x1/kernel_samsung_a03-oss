#! /bin/sh
# Rissu Project (C) 2024
# libart.so Extractor.

KERNEL_TREE="$(pwd)";
check_dir() {
	if ! test -f $KERNEL_TREE/tools/lib64/libart.so; then
		printf "\nProprietary lib: libart.so not found!, unpacking libart.so ... \n";
		unpack_libart;
	fi
};

unpack_libart() {
	cd $KERNEL_TREE/tools/lib64;
	unxz libart.so.xz;
	cd ../..;
};

main() {
	check_dir;
};

main;
