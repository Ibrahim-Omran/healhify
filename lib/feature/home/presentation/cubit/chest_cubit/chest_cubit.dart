import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'chest_state.dart';

class ScanXrayChestCubit extends Cubit<ScanXrayChestState> {
  ScanXrayChestCubit() : super(ScanXrayInitial());

  File? imageFile;
  List predictions = [];
  String result = ' ';
  double? result2;

  String? model;
  String? label;


  void pickedImage({
    required ImageSource source,
    String? route,
    dynamic arg,
    context,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null)
    {
      imageFile = File(pickedFile.path);
      doImageClassification();
      emit(TakeImageFromUserState());

    }
    else {

      if (kDebugMode) {
        print('Not Select Image');
      }

    }
  }

  void loadDataModelFile() async {
    String? output = await Tflite.loadModel(
      model: model!,
      labels: label!,
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    debugPrint(output);
  }

  void doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
      path: imageFile!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );
    debugPrint(recognitions!.length.toString());
      result = " ";
    recognitions.forEach((element) {
      debugPrint(element.toString());
        result += element['label'];
        result2 = element['confidence'] as double;
        // result2 * 100 => عشان نظهر كام في الميه بالظبط

      },
    );
  }
}
