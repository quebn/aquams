import "package:flutter/material.dart";
import "./aquams.dart";

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
