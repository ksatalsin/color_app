import 'package:color_app/app/app.dart';
import 'package:color_app/main_screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MainScreenPage), findsOneWidget);
    });
  });
}
