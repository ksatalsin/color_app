import 'package:bloc_test/bloc_test.dart';
import 'package:color_app/main_screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

class MockMainScreenBloc extends MockBloc<MainScreenEvent, MainScreenState>
    implements MainScreenBloc {}

void main() {
  group('MainScreenPage', () {
    testWidgets('renders MainScreenView', (tester) async {
      await tester.pumpApp(const MainScreenPage());
      expect(find.byType(MainScreenView), findsOneWidget);
    });
  });
}
