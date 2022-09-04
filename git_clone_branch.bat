@echo off
REM #### STEP1�F�ϐ��̒l��ݒ� ####
REM ������YYYYMMDDHHMMSS�`���Ŏ擾���A�R�~�b�g���b�Z�[�W�ɕt��
set YYYYMMDDHHMMSS=%DATE:~0,4%/%DATE:~5,2%/%DATE:~8,2% %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
set COMMIT_COMMENT=�����F%YYYYMMDDHHMMSS%
REM �R�~�b�g���b�Z�[�W��ǋL
set COMMIT_COMMENT=%COMMIT_COMMENT% XXXX�̈Č���XXXX��XXXX�ӏ����C��

REM Git���|�W�g���̃N���[��URL���w��
REM GIT_REPOSITORY=[�����g�̃��|�W�g���̃N���[��URL]
set GIT_REPOSITORY=https://github.com/Tatsuya-Yazaki/common-tools.git

REM ���݃f�B���N�g���{���|�W�g�����B�N���[����ɐ�������郊�|�W�g���̃t�H���_�Ɉړ�
REM DIRECTORY=%CD%\[�����g�̃��|�W�g����]
set DIRECTORY=%CD%\common-tools

REM Branch�����w��i�_�u���N�H�[�g���͕s�v�����{��OK�j
REM GIT_BRANCH_NAME=XXXXX
set GIT_BRANCH_NAME=20220904_GitHub_Clone_Checkout_Add_Commit_Push_Automate

REM #### STEP2�F���[�h�ɂ�镪�� ####
REM "%1"�F�ŏ��̈������擾 
REM "%~1"�F��L����_�u���N�H�[�g�����O���� 
REM ��P�����Łu1�v���^�����Ă���ꍇ
REM �@�˃��|�W�g���̃N���[���ƃ`�F�b�N�A�E�g�����{
if "%~1"=="1" goto CLONE_CHECKOUT
REM ��Q�����Łu2�v���^�����Ă���ꍇ
REM �@�˃��|�W�g���ւ̃R�~�b�g�ƃv�b�V�������{
if "%~1"=="2" goto COMMIT_PUSH
goto EXIT

REM #### STEP3�F���[�h1�̏ꍇ�A�`�F�b�N�A�E�g�ƃu�����`�쐬�����{ ####
:CLONE_CHECKOUT
git clone "%GIT_REPOSITORY%"
cd "%DIRECTORY%"
git checkout -b "%GIT_BRANCH_NAME%"

REM #### STEP4�F���[�h2�̏ꍇ�A�R�~�b�g�ƃv�b�V�������{ ####
:COMMIT_PUSH
REM ��Q�����Ń��[�U�[��������A�R�~�b�g�R�����g�ɕt�^
REM set USER_NAME=%2
REM set COMMIT_COMMENT=%COMMIT_COMMENT% �X�V��: %USER_NAME%
git add -A
git commit -am "%COMMIT_COMMENT%"
git push "%GIT_REPOSITORY%"

:EXIT
pause
