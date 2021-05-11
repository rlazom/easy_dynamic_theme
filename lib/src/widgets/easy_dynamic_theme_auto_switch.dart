import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class EasyDynamicThemeAutoSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      key: Key('EasyDynamicThemeAutoSwitch'),
      value: EasyDynamicTheme.of(context).themeMode == ThemeMode.system,
      onChanged: (bool value) =>
          EasyDynamicTheme.of(context).changeTheme(dynamic: value),
    );
  }
}
