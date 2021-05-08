import 'package:easy_dynamic_theme/src/services/shared_preferences_service.dart';
import 'package:easy_dynamic_theme/src/widgets/easy_dynamic_theme_btn.dart';
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

  group('Check EasyDynamicThemeBtn Widget', () {
    testWidgets('starts with a loading spinner', (WidgetTester tester) async {
      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeBtn(),
      );

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);
    });

    testWidgets('should show the default widget - automatic icon',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();

      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeBtn(),
      );

      SharedPreferences.setMockInitialValues({});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
    });

    testWidgets('should show the default widget - light icon',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();

      var appWdt = DefaultAppWrapper(
        child: EasyDynamicThemeBtn(),
      );

      SharedPreferences.setMockInitialValues({'is_dark': false});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_4), findsNothing);
      expect(find.byIcon(Icons.brightness_high), findsOneWidget);
    });

    testWidgets('should show the default widget - light icon',
        (WidgetTester tester) async {
      mockSharedPreferencesService = MockSharedPreferencesService();
      // mockSharedPreferencesService.loadInstance();

      var materialApp = StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            themeMode: EasyDynamicTheme.of(context).themeMode,
            home: Scaffold(
              body: EasyDynamicThemeBtn(),
            ),
          );
        },
      );

      var appWdt = EasyDynamicThemeWidget(
        child: materialApp,
      );

      SharedPreferences.setMockInitialValues({'is_dark': true});
      mockSharedPreferencesService.prefs =
          await SharedPreferences.getInstance();
      // when(mockSharedPreferencesService.isDark()).thenAnswer((_) => false);

      await tester.pumpWidget(appWdt);
      expect(find.byKey(Key('loading')), findsOneWidget);

      await tester.pumpWidget(appWdt);

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('EasyDynamicThemeBtn')), findsOneWidget);
      expect(find.byIcon(Icons.brightness_high), findsNothing);
      expect(find.byIcon(Icons.brightness_4), findsOneWidget);
    });
  });
}
