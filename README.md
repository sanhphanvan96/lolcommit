# Random Commit Message Generator

This script generates a random commit message. You can specify a theme or search for a keyword in all themes.

## Set up

```bash
git clone https://github.com/sanhphanvan96/lolcommit.git
ln -s "$PWD"/bin/lolcommit.sh /usr/local/bin/lolcommit
```
## Usage

```bash
lolcommit [OPTIONS]
```

### Directly in a Git Commit Message

You can use `lolcommit` directly within a Git commit message by embedding it in the `-m` option:
```bash
git commit -m "$(lolcommit)"
```

## Options

- `-h, --help`: Show the help message and exit
- `-l, --list`: List available themes
- `-t THEME`: Use the specified theme (optional)
- `-s SEARCH`: Search for a keyword in all themes and generate a random commit from the results

## Examples

To generate a random commit message from all themes:

```
$ lolcommit
The code was feeling a bit too predictable, so I randomized it
```

To generate a random commit message from a theme:

```
$ lolcommit -t humorous
I swear it worked on my machine
```

To search for a keyword in all themes and generate a random commit from the results:

```
$ lolcommit -s bug
Just another day at the office, fixed a bug

$ lolcommit -s code
The code was feeling lonely, so I added some more lines

$ lolcommit -s coffee
This commit is like a coffee break, it fixes everything
```

## Themes

Themes are stored as text files in the `themes` directory. Each line in a theme file is a possible commit message.

To add a new theme, simply add a new text file to the `themes` directory.
