# Easy Dynamic Theme
  
This is a new and easy approach on Flutter Themes.

Automatically get your OS defined Theme (Dynamic), force your prefered one (Light / Dark) and persist your choice in the device.

Easy peasy, don't you think? ;)

## Getting Started  
  
For help getting started with Flutter, view our [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.  
  
## Minimum Requirements  
  
- Dart SDK: >=2.7.0 <3.0.0  
- Flutter: >= 1.17.0  
  
## Installation and Usage  
  
Once you're familiar with Flutter you may install this package adding `easy_dynamic_theme` to the dependencies list  
of the `pubspec.yaml` file as follow:  
  
```yaml  
dependencies:  
 flutter: sdk: flutter  
 easy_dynamic_theme: ^1.0.0
 ```
 
Then run the command `flutter packages get` on the console.  
  
## Examples of use  
  
All magic occurs in your `main.dart` file  
  
```dart  
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'home.dart';

void main() async { 
  runApp( 
    EasyDynamicThemeWidget( 
      child: MyApp(), 
    ), 
  );
}  
  
class MyApp extends StatelessWidget {  
  final String title = 'EDT - Example'; 
   
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: title, 
      theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(), 
      themeMode: EasyDynamicThemeWidget.of(context).themeMode, 
      home: new MyHomePage(title: title,) 
    ); 
  }
}  
```  
  
### How to use predefined Themes 
  
You can use your own themes as follows:

In the file `themes.dart` define your *Themes*
```dart  
  import 'package:flutter/material.dart';
  
  var lightThemeData = new ThemeData(
      primaryColor: Colors.blue,
      textTheme: new TextTheme(button: TextStyle(color: Colors.white70)),
      brightness: Brightness.light,
      accentColor: Colors.blue);
  
  var darkThemeData = ThemeData(
      primaryColor: Colors.blue,
      textTheme: new TextTheme(button: TextStyle(color: Colors.black54)),
      brightness: Brightness.dark,
      accentColor: Colors.blue);
```  
  
And then in your `main.dart` file import your themes file and use them on **MaterialApp** attributes *theme* and *darkTheme*
```dart  
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'theme.dart';
import 'home.dart';

void main() async { 
  runApp( 
    EasyDynamicThemeWidget( 
      child: MyApp(), 
    ), 
  );
}  
  
class MyApp extends StatelessWidget {  
  final String title = 'EDT - Example'; 
   
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: title, 
      theme: lightThemeData, 
      darkTheme: darkThemeData, 
      themeMode: EasyDynamicThemeWidget.of(context).themeMode, 
      home: new MyHomePage(title: title,) 
    ); 
  }
}  
```  
  
### How to change the ThemeMode in your app  
  
You can use the function **changeTheme** from anywhere in your app.

This function have two optional parameters: *dynamic* and *dark*.
If the value of *dynamic* is *true*, it takes precedence over *dark*.
```dart  
  EasyDynamicTheme.of(context).changeTheme();
```  
  
  
### How to get your app current theme  

#### Current app ThemeMode:
```dart  
ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode;  
```  
  
The above example will return a value of the *enum* used by **MaterialApp's** **ThemeMode** with one of the following values:

**system** - *Use either the light or dark theme based on what the user has selected in the system settings.*

**light** - *Always use the light mode regardless of system preference.*

**dark** - *Always use the dark mode (if available) regardless of system preference.*

#### Current Context brightness:
```dart  
Brightness brightness = Theme.of(context).brightness;  
```  

Or if you want to know if your widget is dark mode based, you can achieve it with:
```dart  
bool isDarkModeOn = Theme.of(context).brightness == Brightness.dark;  
```  

### What about some out-of-the-box widgets?
#### Right now we have:
- **EasyDynamicThemeBtn**, which is (kind of) a *FlatButton* that displays the icon according to the current theme of your app and allows you to switch between them.
- **EasyDynamicThemeSwitch**, which is a *Switch* widget, based on the current theme's brightness of your context and allows you to switch between **light/dark** them.