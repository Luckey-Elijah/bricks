import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:{{name.snakeCase()}}/{{name.snakeCase()}}.dart';

Future<int?> main(List<String> args) async {
  final logger = Logger();
  final runner = CommandRunner<int>(
    '{{name.snakeCase()}}',
    '{{desc}}',
  )..addCommand(SquareCommand(logger: logger));

  return runner.run(args);
}
