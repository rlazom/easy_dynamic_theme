import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          EasyDynamicThemeSwitch(),
          EasyDynamicThemeBtn(),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          new Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          new Container(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
          ),
          new ClipRect(
            child: new Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'You have pushed the button this many times:',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.justify,
                      ),
                      new Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:
            Icon(Icons.add, color: Theme.of(context).textTheme.button?.color),
      ),
    );
  }
}
