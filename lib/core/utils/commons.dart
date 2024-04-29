import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}

void showSnackBar(BuildContext context , String message,Color? color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
      message,
    ),),
  );}


Future<XFile?> pickImage(ImageSource source) async {
  XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}



//
// // عشان اقدر اخزن الصورة في api
// Future uploadImageToApi(XFile image) async {
//   return MultipartFile.fromFileSync(image.path,
//       filename: image.path.split('/').last);

//}
