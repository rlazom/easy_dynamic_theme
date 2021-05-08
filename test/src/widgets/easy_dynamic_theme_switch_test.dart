import 'package:easy_dynamic_theme/src/services/shared_preferences_service.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../default_app_wrapper.dart';

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

void main() {
  SharedPreferencesService mockSharedPreferencesService;

  group('Check EasyDynamicThemeSwitch Widget', () {
    testWidgets('starts with a loading spinner', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeSwitch(),
      );

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);
    });

    testWidgets(
        'should show the Switch with value for the default case - false',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();

      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeSwitch(),
      );

      SharedPreferences.setMockInitialValues({});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      final Finder switchFinder = find.byKey(Key('EasyDynamicThemeSwitch'));
      expect(switchFinder, findsOneWidget);
      expect(find.byKey(Key('loading')), findsNothing);

      final switchWdt = tester.widget<Switch>(switchFinder);
      expect(switchWdt.value, false);
    });

    testWidgets('should show the Switch with value - true',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();

      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeSwitch(),
      );

      SharedPreferences.setMockInitialValues({'is_dark': true});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      final Finder switchFinder = find.byKey(Key('EasyDynamicThemeSwitch'));
      expect(switchFinder, findsOneWidget);
      expect(find.byKey(Key('loading')), findsNothing);

      Switch switchWdt = tester.widget<Switch>(switchFinder);
      expect(switchWdt.value, true);
    });

    testWidgets(
        'should show the Switch with value "false" and toggle to "true"',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();

      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeSwitch(),
      );

      SharedPreferences.setMockInitialValues({'is_dark': false});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      final Finder switchFinder = find.byKey(Key('EasyDynamicThemeSwitch'));
      expect(switchFinder, findsOneWidget);
      expect(find.byKey(Key('loading')), findsNothing);

      Switch switchWdt = tester.widget<Switch>(switchFinder);
      expect(switchWdt.value, false);

      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      switchWdt = tester.widget<Switch>(switchFinder);
      expect(switchWdt.value, true);
    });
  });
}
