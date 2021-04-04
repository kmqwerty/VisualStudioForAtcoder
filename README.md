# VisualStudioForAtcoder
Visual Studio 2019/2017用に競技プログラミング用のプロジェクトを自動で生成するためのバッチファイル、およびCmakeListのサンプルです。

# 実行環境

Windows 10 Home 64bit 20H2

Cmake 3.18.0

Python  3.9.2

Visual Studio Community 2019 16.9.2

# 必要なアプリケーションのインストール

必要になるPythonやCmakeのインストールを行ってください。コマンドプロンプトにてパスを通してください。

また、バッチファイル内で[Online-judge-tools](https://github.com/online-judge-tools/oj)を使用しています。

pipからonline-judge-toolsを取得してください。

コマンドプロンプトにて、

C:\Users\user1>python -m pip install online-judge-tools

と入力します。

コマンドプロンプトにてojと入力してパスが通ってればOKです。

# 使用方法

1．このプロジェクトをCloneしてください。

2．GenerateAtCoderProjectWin64VS2019.batを起動してと解きたい問題を入力してください。
* Build以下に当該プロジェクト
* test以下に当該プロジェクトのサンプルケース
* Source以下にtemplate.cppをコピーしたcppファイル

が生成されます。

3. Build以下の当該プロジェクトを起動してください。（デフォルトで起動するようにバッチファイルを設定してます。）

必要に応じてInclude以下にIncludeしたいヘッダ等（bitsc++.h等)を格納してください。



