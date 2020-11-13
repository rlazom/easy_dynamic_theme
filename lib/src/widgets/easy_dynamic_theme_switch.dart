import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class EasyDynamicThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Theme.of(context).brightness == Brightness.dark,
        onChanged: (bool value) {
          EasyDynamicTheme.of(context).changeTheme(dark: value);
        });
  }
}
