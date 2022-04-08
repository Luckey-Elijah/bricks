import 'package:args/command_runner.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:mason_logger/mason_logger.dart';

Future<int?> main(List<String> args) async {
  final logger = Logger();
  final runner = CommandRunner<int>(
    '{{#snakeCase}}{{name}}{{/snakeCase}}',
    'A starting point for a command line/console program.',
  )..addCommand(SquareCommand(logger: logger));

  return runner.run(args);
}
