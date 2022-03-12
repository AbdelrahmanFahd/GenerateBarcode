import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({Key? key}) : super(key: key);

  @override
  State<ScanBarcode> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.black,
            ),
            onPressed: scanBarcode,
            label: const Text('Start Scan'),
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          const SizedBox(height: 20),
          Text(
            result == null
                ? 'Scan a code'
                : 'Scan result: ${result.toString()}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } catch (e) {
      print(e);
      scanResult = 'Failed to get platform version.';
    }

    setState(() {
      result = scanResult;
    });
  }
}
