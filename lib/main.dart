import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Change Theme',
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemConfig.dark().getTheme()
          : MyAppThemConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark) {
              _themeMode = ThemeMode.light;
            } else {
              _themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemMode;

  const MyHomePage({Key? key, required this.toggleThemMode}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool _status = false;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meditation',
                style: GoogleFonts.mcLaren(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/ic_home.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: widget.toggleThemMode,
                child: Card(
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      'Change Theme',
                      style: GoogleFonts.mcLaren(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppThemConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondryTextColor;
  final Color surfaceTextColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemConfig.dark()
      : primaryTextColor = Colors.white,
        secondryTextColor = Colors.white70,
        surfaceTextColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        brightness = Brightness.dark,
        appBarColor = Colors.black;

  MyAppThemConfig.light()
      : primaryTextColor = Colors.black,
        secondryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceTextColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        brightness = Brightness.light,
        appBarColor = Color.fromARGB(255, 235, 235, 235);

  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      brightness: brightness,
    );
  }
}
