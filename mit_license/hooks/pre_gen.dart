import 'package:mason/mason.dart';

void run(HookContext context) {
  final now = DateTime.now();
  context.vars = {...context.vars, 'year': '${now.year}'};
}
