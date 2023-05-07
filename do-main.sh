#! /bin/bash
KranulVer="44"
branch="hmp-test"
CODENAME="X00TD"
WithSpec="Y"
PrivBuild="N"
PureKernel="N"
CUSKERNAME="SkyWalker-BETA" # Add "DCKN" on ResetBranch if u don't want Kernel Name Changed again
CUSKERLINK=""
CUSBUILDDATE=""
CUSSPEC=""
CUSCLANGVER=""
CUSLLDVER=""
CUSMSGWORD=""
TypeBuild="TEST"
BuilderKernel="sdclang"

if [ "$KranulVer" = "419" ];then
CAFTAG="04900"
fi

if [ "$BuilderKernel" != "proton" ] && [ "$BuilderKernel" != "dtc" ] && [ "$BuilderKernel" != "gcc" ] && [ "$BuilderKernel" != "gcc12" ] && [ "$BuilderKernel" != "storm" ] && [ "$BuilderKernel" != "strix" ] && [ "$BuilderKernel" != "sdclang" ] && [ "$BuilderKernel" != "atom" ] && [ "$BuilderKernel" != "zyc" ] && [ "$BuilderKernel" != "neutron" ] && [ "$BuilderKernel" != "trb" ];then
    exit;
fi

source main.sh

getInfo ">> Starting Build . . . . <<"
if [ ! -z "$CUSKERNAME" ];then
ChangeKName "$CUSKERNAME"
fi

if [ "$PureKernel" == "N" ] && [ $TypeBuild = "RELEASE" ];then
BuildAll
else
ResetBranch
StockFreq
CompileKernel
StockFreq "revert"
CompileKernel
SwitchDevice "M2"
ResetBranch
CompileKernel
StockFreq
CompileKernel
fi;