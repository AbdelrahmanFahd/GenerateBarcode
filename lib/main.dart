import 'package:flutter/material.dart';
import 'scan_barcode.dart';
import 'generate_barcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt), label: 'Scan Barcode'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Generate Barcode'),
          ],
        ),
        appBar: AppBar(
          title: const Text('Generate Barcode'),
          centerTitle: true,
        ),
        body: index == 1 ? GenerateBarcode() : ScanBarcode(),
      ),
    );
  }
}
