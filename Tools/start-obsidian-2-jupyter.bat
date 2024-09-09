@echo off
set USERNAME=your-user-name

set VAULT=C:\Users\%USERNAME%\Documents\obsidian-2-jupyter
set BIN=C:\Users\%USERNAME%\.raku\bin

echo Converting an entire vault
raku %BIN%\obsidian2ipynb --verbose --input-dir %VAULT%
pause

REM echo Converting single file
REM raku %BIN%\from-markdown %VAULT%\Exercises\some-exercise.md --flavor obsidian --to jupyter --default-language python --output %VAULT%\Exercises\some-exercise.ipynb
REM echo created %VAULT%\Exercises\some-exercise.ipynb
REM pause

REM echo Start daemon mode
REM raku %BIN%\obsidian2ipynb --daemon --input-dir %VAULT%
REM pause