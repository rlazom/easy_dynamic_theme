import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_dynamic_theme/src/services/shared_preferences_service.dart';
import 'default_app_wrapper.dart';

class MockSharedPreferencesService extends Mock implements SharedPreferencesService {}

void main() {
  SharedPreferencesService mockSharedPreferencesService;
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Check EasyDynamicTheme initialThemeMode feature', () {
    testWidgets('starts without define a initialThemeMode should start with ThemeMode.system', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeBtn(),
      );


      mockSharedPreferencesService = MockSharedPreferencesService();
      SharedPreferences.setMockInitialValues({});
      mockSharedPreferencesService.prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
    });

    testWidgets('starts with an initialThemeMode (ThemeMode.dark)', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        initialThemeMode: ThemeMode.dark,
        child: EasyDynamicThemeBtn(),
      );

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_4), findsOneWidget);
    });

    testWidgets('starts with an initialThemeMode (ThemeMode.light)', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        initialThemeMode: ThemeMode.light,
        child: EasyDynamicThemeBtn(),
      );

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_high), findsOneWidget);
    });

    testWidgets('starts with an initialThemeMode (ThemeMode.system)', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        initialThemeMode: ThemeMode.system,
        child: EasyDynamicThemeBtn(),
      );

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
    });
  });
}
