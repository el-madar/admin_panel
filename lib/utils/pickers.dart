
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImage() async {
  Uint8List? pickedBytes;
  await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
    await value!.readAsBytes().then((value) {
      pickedBytes = value;
    });
  }).onError((error, stackTrace) {
    throw Exception(error);
  });

  return pickedBytes;

}