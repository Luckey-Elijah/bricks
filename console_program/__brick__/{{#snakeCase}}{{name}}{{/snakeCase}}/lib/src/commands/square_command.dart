import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:meta/meta.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

/// {@template square_command}
/// Entry point for command multiplying the provided value by itself.
/// {@endtemplate}
class SquareCommand extends Command<int> {
  /// {@macro square_command}
  SquareCommand({required Logger logger}) : _logger = logger;

  final Logger _logger;

  void _squareLog(String val) => _logger.success('${square(num.parse(val))}');

  /// [ArgResults] which can be overridden for testing.
  @visibleForTesting
  static ArgResults? argResultOverrides;

  ArgResults get _argResults => argResultOverrides ?? argResults!;

  @override
  int run() {
    try {
      if (_argResults.rest.isEmpty) {
        final value = _logger.prompt('\nNumber you want to square?');
        _squareLog(value);
      } else {
        _argResults.rest.forEach(_squareLog);
      }
      return 0;
    } catch (_) {
      _logger.err('Please provide a number.');
      return 1;
    }
  }

  @override
  String get description => 'Multiplies the provided value by itself';

  @override
  String get name => 'square';
}
