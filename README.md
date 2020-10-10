# Easy Dynamic Theme
  
This is a new and easy approach on Flutter Themes.

Automatically you will get your OS defined Theme (Dynamic) or just force one of your preference (Light / Dark) and of course, persist this choice in your device.

Easy peasy, don't you think? ;)

## Getting Started  
  
For help getting started with Flutter, view our  
[online documentation](https://flutter.dev/docs), which offers tutorials,  
samples, guidance on mobile development, and a full API reference.  
  
## Minimum Requirements  
  
- Dart SDK: >=2.7.0 <3.0.0  
- Flutter: >= 1.17.0  
  
## Installation and Usage  
  
Once you're familiar with Flutter you may install this package adding `easy_dynamic_theme` to the dependencies list  
of the `pubspec.yaml` file as follow:  
  
```yaml  
dependencies:  
 flutter: sdk: flutter  
 easy_dynamic_theme: ^0.0.2
 ```
 
Then run the command `flutter packages get` on the console.  
  
## Examples of use  
  
All magic occurs in your main.dart file  
  
The following code shows code commented as optional with which you can avoid "flickering" when switching from light to dark mode when the application loads.
  
```dart  
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();  

  ThemeMode initialThemeMode;
  
  // [OPTIONAL - BEGIN]
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool isDark = sp.getBool('is_dark'); 
  if (isDark != null) { 
    initialThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }
  // [OPTIONAL - END]
  
  runApp( 
    EasyDynamicThemeWidget( 
      initialThemeMode: initialThemeMode, 
      child: MyApp(), 
    ), 
  );
}  
  
class MyApp extends StatelessWidget {  
  final String title = 'Dynamic Theme'; 
   
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
  
### How to toggle from dynamic/light/dark in your app  
  
```dart  
  EasyDynamicTheme.of(context).switchTheme();
```  
  
  
### How to get your app current theme  
  
```dart  
ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode;  
```  
  
The above example will return a value of the *enum* used by **MaterialApp's** **ThemeMode** with one of the following values:

**system** - *Use either the light or dark theme based on what the user has selected in the system settings.*

**light** - *Always use the light mode regardless of system preference.*

**dark** - *Always use the dark mode (if available) regardless of system preference.*

### What about some widgets?
Right now we have the **EasyDynamicThemeBtn** widget, which is a flat icon that displays the icon according to the current theme of your app and allows you to switch between them.