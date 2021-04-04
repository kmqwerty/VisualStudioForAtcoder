cmake_minimum_required(VERSION 3.1)
project($ENV{INPUT_STR} CXX)
# XXX.in XXX.outファイルをすべてプロジェクトに追加して閲覧できるように
file( GLOB INPUT_SOURCES ./test/$ENV{INPUT_STR}/*.in )
file( GLOB OUTPUT_SOURCES ./test/$ENV{INPUT_STR}/*.out )
# 必要なファイルをプロジェクトに追加
add_executable($ENV{INPUT_STR} ./Source/$ENV{INPUT_STR}.cpp
                                ${INPUT_SOURCES}
                                ${OUTPUT_SOURCES}
                                ./test/$ENV{INPUT_STR}/input.txt
                                ./test/$ENV{INPUT_STR}/output.txt)
# #include <bits/stdc++.h>等を呼べるように
target_include_directories($ENV{INPUT_STR} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Include/)
#　リンカーの設定をコンソールに
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:CONSOLE")
# input.txtから値を持ってきて実行し、output.txtへ出力結果を出力する
set_target_properties($ENV{INPUT_STR} PROPERTIES VS_DEBUGGER_COMMAND_ARGUMENTS "<$ENV{HOME_DIR}\\test\\$ENV{INPUT_STR}\\input.txt> $ENV{HOME_DIR}\\test\\$ENV{INPUT_STR}\\output.txt")
                               
set_target_properties($ENV{INPUT_STR} PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Source/")
set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT "$ENV{INPUT_STR}")