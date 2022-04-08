import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['name'] as String;
  final pubGet = context.logger.progress(
    'Running `dart pub get --directory=$name`',
  );

  await Process.run('dart', ['pub', 'get', '--directory=$name']);
  pubGet('Finished `dart pub get --directory=$name`');

  final dartFmt = context.logger.progress('Running `dart format $name`');
  await Process.run('dart', ['format', name]);
  dartFmt('Finished `dart format $name`');
}
