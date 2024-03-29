import 'package:flutter/material.dart';
import '../../easy_dynamic_theme.dart';

class EasyDynamicThemeBtn extends StatelessWidget {
  IconData _getIcon(BuildContext context) {
    var themeMode = EasyDynamicTheme.of(context).themeMode;
    return themeMode == ThemeMode.system
        ? Icons.brightness_auto
        : themeMode == ThemeMode.light
            ? Icons.brightness_high
            : Icons.brightness_4;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      key: Key('EasyDynamicThemeBtn'),
      shape: CircleBorder(),
      onPressed: EasyDynamicTheme.of(context).changeTheme,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(_getIcon(context),
            color: Theme.of(context).textTheme.labelLarge!.color),
      ),
    );
  }
}
