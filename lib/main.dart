import 'package:flutter/material.dart';
import 'package:mini_catalog/screens/catalog_screen.dart.dart';

void main() => runApp(const GiftStoreApp());

class GiftStoreApp extends StatelessWidget {
  const GiftStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const CatalogScreen(),
    );
  }
}