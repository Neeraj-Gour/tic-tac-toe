import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/themes.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/providers/homepage_provider.dart';
import 'package:tic_tac_toe/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

// ThemeProvider _themeProvider = ThemeProvider();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider()),
          ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider())
        ],
        builder: (context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Tic Tac Toe',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
          );
        });
  }
}
