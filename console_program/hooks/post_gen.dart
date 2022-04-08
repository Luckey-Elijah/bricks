import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final path = '${Directory.current.path}/${context.vars['name'] as String}';
  final pubGet = context.logger.progress(
    'Running `dart pub get --directory=$path`',
  );

  await Process.run('dart', ['pub', 'get', '--directory=$path']);
  pubGet('Finished `dart pub get --directory=$path`');

  final dartFmt = context.logger.progress('Running `dart format $path`');
  await Process.run('dart', ['format', '$path']);
  dartFmt('Finished `dart format $path`');
}
