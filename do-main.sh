#! /bin/bash
KranulVer="419"
branch="main-12"
CODENAME="X01BD"
WithSpec="N"
PrivBuild="N"
PureKernel="Y"
CUSKERNAME="Chunmun-Is-Gae-XD" # Add "DCKN" on ResetBranch if u don't want Kernel Name Changed again
CUSKERLINK=""
CUSBUILDDATE=""
CUSSPEC=""
CUSCLANGVER=""
CUSLLDVER=""
TypeBuild="TEST"
BuilderKernel="aosp"

if [ "$KranulVer" = "419" ];then
CAFTAG="03200"
fi

if [ "$BuilderKernel" != "proton" ] && [ "$BuilderKernel" != "dtc" ] && [ "$BuilderKernel" != "gcc" ] && [ "$BuilderKernel" != "gcc12" ] && [ "$BuilderKernel" != "storm" ] && [ "$BuilderKernel" != "strix" ] && [ "$BuilderKernel" != "sdclang" ] && [ "$BuilderKernel" != "atom" ] && [ "$BuilderKernel" != "zyc" ] && [ "$BuilderKernel" != "aosp" ];then
    exit;
fi

source main.sh

getInfo ">> Starting Build . . . . <<"
if [ ! -z "$CUSKERNAME" ];then
ChangeKName "$CUSKERNAME"
fi

if [ $TypeBuild = "TEST" ];then
ResetBranch
CompileKernel
SwitchDevice "M1"
CompileKernel
elif [ "$PureKernel" == "N" ] && [ $TypeBuild = "RELEASE" ];then
BuildAll
fi