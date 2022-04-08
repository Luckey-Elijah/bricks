import 'package:args/args.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockLogger extends Mock implements Logger {}

class MockArgResults extends Mock implements ArgResults {}

void main() {
  late Logger logger;
  late SquareCommand command;
  late ArgResults argResults;

  setUp(() {
    logger = MockLogger();
    argResults = MockArgResults();
    SquareCommand.argResultOverrides = argResults;
    command = SquareCommand(logger: logger);
  });

  tearDown(() => SquareCommand.argResultOverrides = null);

  group('SquareCommand ', () {
    test('description and name', () {
      expect(command.description, 'Multiplies the provided value by itself');
      expect(command.name, 'square');
    });

    test('prompts user when no value is provided and squares that value', () {
      when(() => argResults.rest).thenReturn(const <String>[]);
      when(
        () => logger.prompt(
          '\nNumber you want to square?',
          defaultValue: any(named: 'defaultValue'),
          hidden: any(named: 'hidden'),
        ),
      ).thenReturn('2');
      expect(command.run(), equals(0));
      verify(() => logger.success('4')).called(1);
    });

    test('squares all numbers provided the user', () {
      when(() => argResults.rest).thenReturn(const <String>['1', '2']);
      expect(command.run(), equals(0));
      verify(() => logger.success('1')).called(1);
      verify(() => logger.success('4')).called(1);
    });

    test('logs an error on invalid input from arguments', () {
      when(() => argResults.rest).thenReturn(const <String>['a']);
      expect(command.run(), equals(1));
      verify(() => logger.err('Please provide a number.')).called(1);
    });

    test('logs an error on invalid input from prompt', () {
      when(() => argResults.rest).thenReturn(const <String>[]);
      when(
        () => logger.prompt(
          '\nNumber you want to square?',
          defaultValue: any(named: 'defaultValue'),
          hidden: any(named: 'hidden'),
        ),
      ).thenReturn('a');
      expect(command.run(), equals(1));
      verify(() => logger.err('Please provide a number.')).called(1);
    });
  });
}
