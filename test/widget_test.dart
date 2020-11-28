// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:architecture/notifiers/BottomNavigationNotifierImpl.dart';
import 'package:architecture/repository/repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {});

  test('Check setSelectedItem', () {
    var bottomNavNotifierMock = BottomNavNotifierImpl();
    bottomNavNotifierMock.setSelectedItem(10);
    expect(bottomNavNotifierMock.selectedPage, 10);
  });
}
