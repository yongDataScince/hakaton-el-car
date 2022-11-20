import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/failed_widget.dart';
import 'package:mobile_app/components/standart_loading.dart';
import 'package:mobile_app/core/constats/color_constants.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/register_car.dart';
import 'package:mobile_app/features/cars_list/presentation/store/register_car_store.dart';
import 'package:mobile_app/services/di/locator_service.dart' as di;
import 'package:mobile_app/utilities/accsess_token.dart';
import 'package:mobile_app/utilities/load_states.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final carRegisterStore = di.getIt.get<CarRegisterStore>();
  bool isScanning = false;
  XFile? imageFile;
  String scannedText = '';

  final CarRegParams carRegParams = CarRegParams(
    accessToken: AccessToken.accessToken!,
    ownerId: AccessToken.userId!,
    number: "B003BB",
    carBrand: "Tesla",
    bodyType: "Sedan",
    enginePowerWt: 1000,
    enginePowerHp: 475,
    batteryCapacity: 100,
    releaseYear: 2021,
    bodyColor: "#FF0000",
    weight: 1340,
    photos: ["1", "2", "3", "4"],
  );

  @override
  void initState() {
    carRegisterStore.navigationPop = () => Navigator.of(context).pop();

    carRegisterStore.showWrongCarRegister = () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Произошла ошибка, попробуйте снова'),
        ),
      );
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отсканируйте ПТС')),
      body: Observer(builder: (context) {
        if (carRegisterStore.loadState == LoadStates.loading) {
          return const StandartLoading();
        }
        if (carRegisterStore.loadState == LoadStates.failed) {
          return const FailedWidget();
        }
        if (carRegisterStore.loadState == LoadStates.successful) {
          return SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () async {
                      if (!isScanning && scannedText != '') {
                        await carRegisterStore.register(carRegParams);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.lightBlueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Зарегистрировать авто'),
                    ),
                  ),
                  const HBox(30),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }

  getTextFromImage(XFile image) async {
    final String text =
        await FlutterTesseractOcr.extractText(image.path, language: 'rus+eng');
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
