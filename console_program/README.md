# console_program

Creates a simple console program that can easily be extended to fit your needs. Includes simple,
fully tested code.

## Usage

```sh
mason make console_program --name example
```

## Variables


| Variable | Description                 | Default           | Type     |
| -------- | --------------------------- | ----------------- | -------- |
| `name`   | Name of the console program | `console program` | `string` |

## Example

```sh
mason make console_program --name example
```

Creates the following:
```
example/
├── README.md
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
├── bin/example.dart
├── lib/
│   ├── example.dart
│   └── src/
│       ├── commands/
│       │   ├── commands.dart
│       │   └── square_command.dart
│       ├── src.dart
│       └── utils/
│           ├── square.dart
│           └── utils.dart
└── test/src/
         ├── commands/square_command_test.dart
         └── utils/square_test.dart
```

And then you can run it with:

```sh
# activate this program
dart pub global activate --source path example

# run this program
dart pub global run example --help
```

The `help` command shows:

```
A starting point for a command line/console program.

Usage: example <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  square   Multiplies the provided value by itself

Run "example help <command>" for more information about a command.
```
