import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['name'] as String;

  final cleanUp = context.logger.progress(
    'Running `dart pub get --directory=$name`',
  );

  await Process.run('dart', ['pub', 'get', '--directory=$name']);
  cleanUp.update('Finished `dart pub get --directory=$name`');

  await Process.run('dart', ['format', name]);
  cleanUp.complete('Finished `dart format $name`');
}
