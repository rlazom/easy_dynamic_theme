import 'package:easy_dynamic_theme/src/services/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Check SharedPreferencesService', () {
    SharedPreferencesService sharedPreferencesService;

    testWidgets('Class construction and initialization',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      sharedPreferencesService = new SharedPreferencesService();
      expect(sharedPreferencesService.prefs, null,
          reason: "Constructor initializes to null");

      sharedPreferencesService.prefs = await SharedPreferences.getInstance();
      expect(sharedPreferencesService.prefs != null, true,
          reason: "Constructor without parameters initializes to null");
    });

    testWidgets('should remove "IS_DARK" shared preference value',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({'is_dark': true});

      sharedPreferencesService = new SharedPreferencesService();
      sharedPreferencesService.prefs = await SharedPreferences.getInstance();

      expect(sharedPreferencesService.isDark(), true,
          reason: "The mock sharedPreference value was defined in 'true'");

      sharedPreferencesService.clearPref(SharePrefsAttribute.IS_DARK);
      expect(sharedPreferencesService.isDark(), null,
          reason: "The mock sharedPreference value was deleted");
    });
  });
}
