@ECHO OFF
:: 文字コードをutf-8に
chcp 65001
:: 問題を入力
:INPUT_START
ECHO +-------------------------------------------------------+
ECHO  問題を入力してください(例:abc012_a)
ECHO +-------------------------------------------------------+
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
ECHO +-------------------------------------------------------+
ECHO  [%INPUT_STR%]のサンプルを取得します。
ECHO +-------------------------------------------------------+

:: online-judge-toolsからサンプルをDL

oj dl https://"%INPUT_STR:~0,6%".contest.atcoder.jp/tasks/"%INPUT_STR%"

:: サンプルファイルを問題のフォルダ毎に格納
mkdir test\"%INPUT_STR%"
move  test\*.in test\"%INPUT_STR%"
move  test\*.out test\"%INPUT_STR%"

 IF NOT EXIST test\"%INPUT_STR%"\input.txt (
     type nul > test\"%INPUT_STR%"\input.txt
ECHO +-------------------------------------------------------+
ECHO  input.txtを新規に作成しました。
ECHO +-------------------------------------------------------+
 ) else (
ECHO +-------------------------------------------------------+
ECHO  input.txtがすでに存在します。
ECHO +-------------------------------------------------------+
 )

 IF NOT EXIST test\"%INPUT_STR%"\output.txt (
    type nul > test\"%INPUT_STR%"\output.txt
    ECHO +-------------------------------------------------------+
    ECHO  output.txtがすでに存在します。
    ECHO +-------------------------------------------------------+
 ) else (
ECHO +-------------------------------------------------------+
ECHO  output.txtがすでに存在します。
ECHO +-------------------------------------------------------+
 )


ECHO +-------------------------------------------------------+
ECHO  完了しました。
ECHO +-------------------------------------------------------+
 
 IF NOT EXIST Source\"%INPUT_STR%".cpp (
     copy template.cpp Source\"%INPUT_STR%".cpp
 )


set HOME_DIR=%~dp0
echo %HOME_DIR% test
:: 当該ディレクトリに移動
mkdir Build
cd Build

mkdir "%INPUT_STR%"
cd "%INPUT_STR%"



:: カレントパスをSOURCE_DIRにセット
set SOURCE_DIR=%~dp0

:: buildディレクトリをSOURCE_DIRにセット
set BUILD_DIR=%SOURCE_DIR%\Build\"%INPUT_STR%"

:: ビルド構成（コンパイラー、アーキテクチャ）を指定
set GENERATOR_NAME=Visual Studio 16



:: CMakeによるプロジェクト生成
cmake.exe ^
-G"%GENERATOR_NAME%" ^
-A x64 ^
--build "%BUILD_DIR%" ^
%SOURCE_DIR%


ECHO +-------------------------------------------------------+
ECHO  [%INPUT_STR%]のプロジェクトを起動します。
ECHO +-------------------------------------------------------+

start %INPUT_STR%.sln

pause