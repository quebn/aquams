import "package:flutter/material.dart";
import "aquams.dart";

void main() {
  runApp(const AquamsApp());
}

class AquamsApp extends StatelessWidget {
  const AquamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Aquams(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
