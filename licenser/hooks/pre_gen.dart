import 'package:mason/mason.dart';

void run(HookContext context) {
  final license = context.vars['license'] as String;

  final needsYearAndOwner =
      license == 'BSD 3-Clause "New" or "Revised" license' ||
          license == 'MIT license';

  context.vars = {
    ...context.vars,
    ...buildBooleans(license),
    if (needsYearAndOwner) ...buildYearAndOwner(context.logger)
  };
}

Map<String, String> buildYearAndOwner(Logger logger) => {
      'year': '${DateTime.now().year}',
      'owner': logger.prompt(
        '${lightBlue.wrap('Project Owner')} (name or organization):',
      ),
    };

Map<String, bool> buildBooleans(String license) => {
      for (final key in licenseBooleans.keys)
        licenseBooleans[key]!: license == key
    };

const licenseBooleans = <String, String>{
  'Apache License 2.0': 'isApache',
  'BSD 3-Clause "New" or "Revised" license': 'isBsd',
  'GNU General Public License (GPL)': 'isGnu',
  'MIT license': 'isMit',
  'Mozilla Public License 2.0': 'isMozilla',
};
