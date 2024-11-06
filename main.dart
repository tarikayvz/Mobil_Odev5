import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: HomePage(toggleTheme: toggleTheme),
    );
  }
}

// Açık tema
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Karanlık tema
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  backgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
  ),
);

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomePage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Değiştirme Uygulaması'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tema Değiştir',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text('Temayı Değiştir'),
            ),
          ],
        ),
      ),
    );
  }
}
