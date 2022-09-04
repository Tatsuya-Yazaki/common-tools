@echo off
REM #### STEP1：変数の値を設定 ####
REM 時刻をYYYYMMDDHHMMSS形式で取得し、コミットメッセージに付加
set YYYYMMDDHHMMSS=%DATE:~0,4%/%DATE:~5,2%/%DATE:~8,2% %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
set COMMIT_COMMENT=日時：%YYYYMMDDHHMMSS%
REM コミットメッセージを追記
set COMMIT_COMMENT=%COMMIT_COMMENT% XXXXの案件でXXXXのXXXX箇所を修正

REM GitリポジトリのクローンURLを指定
REM GIT_REPOSITORY=[ご自身のリポジトリのクローンURL]
set GIT_REPOSITORY=https://github.com/Tatsuya-Yazaki/common-tools.git

REM 現在ディレクトリ＋リポジトリ名。クローン後に生成されるリポジトリのフォルダに移動
REM DIRECTORY=%CD%\[ご自身のリポジトリ名]
set DIRECTORY=%CD%\common-tools

REM Branch名を指定（ダブルクォート等は不要＆日本語OK）
REM GIT_BRANCH_NAME=XXXXX
set GIT_BRANCH_NAME=20220904_GitHub_Clone_Checkout_Add_Commit_Push_Automate

REM #### STEP2：モードによる分岐 ####
REM "%1"：最初の引数を取得 
REM "%~1"：上記からダブルクォートを除外する 
REM 第１引数で「1」が与えられている場合
REM 　⇒リポジトリのクローンとチェックアウトを実施
if "%~1"=="1" goto CLONE_CHECKOUT
REM 第２引数で「2」が与えられている場合
REM 　⇒リポジトリへのコミットとプッシュを実施
if "%~1"=="2" goto COMMIT_PUSH
goto EXIT

REM #### STEP3：モード1の場合、チェックアウトとブランチ作成を実施 ####
:CLONE_CHECKOUT
git clone "%GIT_REPOSITORY%"
cd "%DIRECTORY%"
git checkout -b "%GIT_BRANCH_NAME%"

REM #### STEP4：モード2の場合、コミットとプッシュを実施 ####
:COMMIT_PUSH
REM 第２引数でユーザー名を受取り、コミットコメントに付与
REM set USER_NAME=%2
REM set COMMIT_COMMENT=%COMMIT_COMMENT% 更新者: %USER_NAME%
git add -A
git commit -am "%COMMIT_COMMENT%"
git push "%GIT_REPOSITORY%"

:EXIT
pause
