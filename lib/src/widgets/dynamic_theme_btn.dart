import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class DynamicThemeBtn extends StatelessWidget {

  IconData _getIcon(BuildContext context) {
    var themeMode = DynamicTheme.of(context).themeMode;
    return themeMode == ThemeMode.system ? Icons.brightness_auto : themeMode == ThemeMode.light ? Icons.brightness_high : Icons.brightness_4;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: (){DynamicTheme.of(context).switchTheme();},
      child: new Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Icon(_getIcon(context), color: Theme.of(context).textTheme.button.color),
      ),
    );
  }
}
