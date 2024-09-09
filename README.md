# Obsidian-2-Jupyter
I keep all my notes in [Obsidian](https://obsidian.md/) and needed something to create - from time to time - jupyter notebooks out of some of these Obsidian markdown files. 

This repository shows you one simple way to do it.

For me Obsidian markdown files are the golden source of truth. Hence in my setup the Jupyter notebooks need to get re-created and overwritten.

I am using a [Raku](https://raku.org/) library called [Markdown::Grammar](https://raku.land/zef:antononcube/Markdown::Grammar) which comes with the command line utility `from-markdown` - you can use that on a per-file basis on the command line.

```bash
from-markdown path/to/some-markdown-file.md --flavour obsidian --to jupyter --default-language python --output /other/path/to/some-markdown-file.ipynb
```

However, I wanted to convert **all** markdown files that contain a code block into corresponding Jupyter notebooks, so I use `Markdown::Grammar` inside a small, custom script that iterates trough all the markdown files in my vault(s).

Maybe `Markdown::Grammar` or `from-markdown` could be wrapped in an Obsidian-Plugin, so the user could right-click on files or folders and trigger the markdown-2-jupyter transformation more easily. I never implemented an Obsidian plugin myself ... but I definitely would like to use such a "make-my-life-easier" plugin.

# Try it yourself

## Install Rakudo

`Markdown::Grammar` requires [Raku](https://raku.org/).

Install [Rakudo-Star](https://rakudo.org/star) - available for [Windows](https://rakudo.org/star/windows), [Mac](https://rakudo.org/star/macos) and [Linux](https://rakudo.org/star/source).

## Install Markdown::Grammar
Install the Raku library [Markdown::Grammar](https://raku.land/zef:antononcube/Markdown::Grammar) by executing on the Command Prompt or Terminal.

```bash
zef install Markdown::Grammar
```

## Checkout some Demo Markdown Files
Checkout this repository which contains some demo markdown files - hence you can test the whole thing savely.

```bash
git clone https://github.com/rcmlz/obsidian-2-jupyter
```

If you replace <your-name> that should work now:

```bash
C:\Users\<your-name>\.raku\bin\from-markdown Exercises\some-exercise.md --flavor obsidian --to jupyter --default-language python --output Exercises\some-exercise.ipynb
```

Optionally: Open the file `obsidian-2-jupyter/Tools/obsidian2ipynb` in a text editor like VS-Code, Kate, Notepad++ etc. and inspect it - better save than sorry. It is written in Raku and it should be obvious how to adjust some settings as needed - eventually it is just a simple text file!

## Create Notebooks
Let there be notebooks ...

Give it a whirl by executing `obsidian-2-jupyter/Tools/obsidian2ipynb` from the command line

```bash
obsidian-2-jupyter/Tools/obsidian2ipynb --verbose
```

or run the script via Raku explicitly

```bash
raku obsidian-2-jupyter/Tools/obsidian2ipynb --verbose
```

Maybe you can just double click `obsidian2ipynb` to execute the script.

## Daemon Mode

In daemon mode the input-dir is watched for changes and Jupyter notebooks get generated automatically on change of Markdown files.

```bash
raku obsidian-2-jupyter/Tools/obsidian2ipynb --daemon --input-dir /path/to/your/vault
```

## Jupyter

Finally, open the created Notebooks in Jupyter and compare the output to Obsidian.

Because you are reading this README.md - I assume you know how to do that.

## Like it?
If you like it copy the folder `Tools/` to your vault - so you can just double-click it to execute the script.

Alternatively use the command line in order to adjust the input-folder(s) to fit your needs.

```bash
obsidian-2-jupyter/Tools/obsidian2ipynb --help
```

## Usage example

Assuming you have more than one Obsidian vault, then you want to put the script `obsidian2ipynb` somewhere central.

Assuming you saved it to `C:\Users\<your-name>\.raku\bin\obsidian2ipynb` you can create a `.bat` file per vault on your Desktop.

So if you have a vault for example in `C:\Users\<your-name>\Documents\obsidian-2-jupyter` put the following lines in the file `obsidian-2-jupyter.bat` on your Desktop.

Adjust the USERNAME accordingly.

```bash
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
```

If you are on Mac or Linux, I assume you know how to adjust the input-directories accordingly.

Tip: Do not forget to put `.ipynb` to your `.gitignore` as you want to force yourself to keep the golden source of truth in the markdown files. The Jupyter notebooks get regenerated as needed.