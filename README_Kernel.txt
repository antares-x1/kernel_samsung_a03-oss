################################################################################
1. Download and unzip the kernel source of A035FXXU4CWI1.

2. Unzip and update the kernel source of A035FXXS5CWK1.

3. How to Build
        - get Toolchain
                From android git serveru, codesourcery and etc ..
                - gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

        - make output folder
                EX) OUTPUT_DIR=out
                $ mkdir out

        - edit Makefile
                edit "CROSS_COMPILE" to right toolchain path(You downloaded).
                        EX)  CROSS_COMPILE=<android platform directory you download>/android/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
                        Ex)  CROSS_COMPILE=/usr/local/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android- // check the location of toolchain
        
        - Export Path
                $ CLANG_TOOL_PATH=<android platform directory you download>/android/prebuilts/clang/host/linux-x86/clang-r383902/bin
                $ export PATH=${CLANG_TOOL_PATH}:${PATH//"${CLANG_TOOL_PATH}:"}
                
        - Export Variables
                $ export BSP_BUILD_FAMILY=qogirl6
                $ export DTC_OVERLAY_TEST_EXT=$(pwd)/tools/mkdtimg/ufdt_apply_overlay
                $ export DTC_OVERLAY_VTS_EXT=$(pwd)/tools/mkdtimg/ufdt_verify_overlay_host
                $ export BSP_BUILD_ANDROID_OS=y

        - Build
                $ make -C $(pwd) O=$(pwd)/out BSP_BUILD_DT_OVERLAY=y CC=clang LD=ld.lld ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu- a03_cis_open_defconfig -j12
                $ make -C $(pwd) O=$(pwd)/out BSP_BUILD_DT_OVERLAY=y CC=clang LD=ld.lld ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu- -j12

4. Output files
        - Kernel : arch/arm64/boot/Image
        - module : drivers/*/*.ko

5. How to Clean
        Change to OUTPUT_DIR folder
        EX) $(pwd)/out
        $ make clean
################################################################################
