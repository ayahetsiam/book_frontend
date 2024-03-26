import 'package:book_ui/views/configs/theme.dart';
import 'package:book_ui/views/screen/main_screem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class DarkModeNotifier with ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DarkModeNotifier(),
      child: Consumer<DarkModeNotifier>(
        builder: (context, darkModeNotifier, _) {
          return MaterialApp(
            theme: darkModeNotifier.darkMode
                ? ThemeData.dark(
                    useMaterial3: true,
                  ).copyWith(
                    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    )),
                    appBarTheme:
                        AppBarTheme(backgroundColor: Colors.deepPurple))
                : ThemeData.light().copyWith(
                    appBarTheme:
                        AppBarTheme(backgroundColor: Colors.blueAccent)),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<DarkModeNotifier>(
              builder: (context, darkModeNotifier, _) {
                return Text(
                  darkModeNotifier.darkMode
                      ? "dart"
                      : "light", // Changer la valeur selon le mode
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Votre logique d'incrémentation ici
              },
              //style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DarkModeNotifier>(context, listen: false)
              .toggleDarkMode();
        },
        tooltip: 'Toggle Dark Mode',
        child: const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
*/