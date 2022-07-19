import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final generateBadge = context.logger.confirm('Generate a badge as well?');
  if (!generateBadge) return;

  final license = context.vars['license'] as String;

  final licenseLabel = licenseLabels[license]!;
  final licenseLink = licenseLinks[license]!;

  final tag = 'https://img.shields.io/badge/license-$licenseLabel-blue';

  context.logger.success('Copy and add this badge to your repo');
  context.logger.info('\t[![$license]($tag)]($licenseLink)');
}

const licenseLabels = <String, String>{
  'Apache License 2.0': 'Apache',
  'BSD 3-Clause "New" or "Revised" license': 'BSD-3',
  'GNU General Public License (GPL)': 'GPL',
  'MIT license': 'MIT',
  'Mozilla Public License 2.0': 'MPL',
};

const licenseLinks = <String, String>{
  'Apache License 2.0': 'https://opensource.org/licenses/Apache-2.0',
  'BSD 3-Clause "New" or "Revised" license':
      'https://choosealicense.com/licenses/bsd-3-clause/',
  'GNU General Public License (GPL)':
      'https://www.gnu.org/licenses/gpl-3.0.en.html',
  'MIT license': 'https://opensource.org/licenses/MIT',
  'Mozilla Public License 2.0': 'https://www.mozilla.org/en-US/MPL/2.0/',
};
