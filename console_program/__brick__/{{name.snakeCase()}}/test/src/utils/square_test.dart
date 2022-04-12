import 'package:test/test.dart';
import 'package:{{name.snakeCase()}}/{{name.snakeCase()}}.dart';

void main() {
  test('square', () {
    expect(square(4), 16);
    expect(square(2), 4);
    expect(square(-2), 4);
    expect(square(0), 0);
    expect(square(2.5), 6.25);
  });
}
