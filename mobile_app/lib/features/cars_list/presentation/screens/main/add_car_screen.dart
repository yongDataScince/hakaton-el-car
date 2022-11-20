import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/core/constats/color_constants.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  bool isScanning = false;
  XFile? imageFile;
  String scannedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Отсканируйте ПТС')),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                if (isScanning) const CircularProgressIndicator(),
                if (!isScanning && imageFile == null)
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey,
                  ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => getImage(ImageSource.gallery),
                      icon: const Icon(CupertinoIcons.photo_fill),
                    ),
                    IconButton(
                      onPressed: () => getImage(ImageSource.camera),
                      icon: const Icon(CupertinoIcons.camera_fill),
                    ),
                  ],
                ),
                Text(scannedText),
                const HBox(20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.lightBlueColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Зарегистрировать авто'),
                )
              ],
            ),
          ),
        ));
  }

  getTextFromImage(XFile image) async {
    final String text =
        await FlutterTesseractOcr.extractText(image.path, language: 'rus');
    scannedText = text;
    isScanning = false;
    setState(() {});
  }

  void getImage(ImageSource imageSource) async {
    try {
      final XFile? pickedImage =
          await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        isScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getTextFromImage(pickedImage);
      }
    } catch (e) {
      isScanning = false;
      imageFile = null;
      setState(() {});
      scannedText = 'Error';
    }
  }
}
