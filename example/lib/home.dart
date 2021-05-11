import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_dynamic_theme_example/blur_container.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlurContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EasyDynamicThemeSwitch(),
                          Text('EasyDynamicThemeSwitch'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlurContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EasyDynamicThemeBtn(),
                          Text('EasyDynamicThemeBtn'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlurContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EasyDynamicThemeAutoSwitch(),
                          Text('EasyDynamicThemeAutoSwitch'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlurContainer(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
            ],
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
