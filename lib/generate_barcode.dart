import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class GenerateBarcode extends StatefulWidget {
  const GenerateBarcode({Key? key}) : super(key: key);

  @override
  State<GenerateBarcode> createState() => _GenerateBarcodeState();
}

class _GenerateBarcodeState extends State<GenerateBarcode> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BarcodeWidget(
                  drawText: false,
                  data: textController.text,
                  barcode: Barcode.code128(),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: TextFormField(
                controller: textController,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                onFieldSubmitted: (_) => setState(() {}),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.check),
                  suffixIconColor: Colors.red,
                  hintText: 'Enter the data',
                  border: OutlineInputBorder(
                    gapPadding: 1.0,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 1.0,
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 1.0,
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
