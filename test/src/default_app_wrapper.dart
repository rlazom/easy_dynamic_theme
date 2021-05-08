import 'package:easy_dynamic_theme/src/easy_dynamic_widget.dart';
import 'package:flutter/material.dart';

class DefaultAppWrapper extends StatelessWidget {
  final Widget child;

  const DefaultAppWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyDynamicThemeWidget(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: EasyDynamicTheme.of(context).themeMode,
            home: Scaffold(
              body: child,
            ),
          );
        },
      ),
    );
  }
}
