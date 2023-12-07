# Random Commit Message Generator

This script generates a random commit message. You can specify a theme or search for a keyword in all themes.

## Usage

```bash
./lolcommit.sh [OPTIONS]
```

## Options

- `-h, --help`: Show the help message and exit
- `-l, --list`: List available themes
- `-t THEME`: Use the specified theme (optional)
- `-s SEARCH`: Search for a keyword in all themes and generate a random commit from the results

## Examples

To generate a random commit message from all themes:

```bash
./lolcommit.sh
```

To generate a random commit message from the `funny` theme:

```bash
./lolcommit.sh -t funny
```

To search for a keyword in all themes and generate a random commit from the results:

```bash
./lolcommit.sh -s bug
```

## Themes

Themes are stored as text files in the `themes` directory. Each line in a theme file is a possible commit message.

To add a new theme, simply add a new text file to the `themes` directory.
