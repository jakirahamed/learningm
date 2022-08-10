import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageServiceProvider =
    StateNotifierProvider<ImageServiceNotifier, List<String>>((ref) {
  return ImageServiceNotifier();
});

class ImageServiceNotifier extends StateNotifier<List<String>> {
  ImageServiceNotifier() : super([]);

  addImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      XFile image = pickedFile;
      final path = File(image.path).path;
      state = [...state, path];
    }
  }

  clear() {
    state = [];
  }

  Future<String> uplodeImg({
    required String path,
    required String filename,
    required String imagepath,
  }) async {
    EasyLoading.show(status: 'Uploading...');
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('$path/$filename').child(filename);

    await ref.putFile(File(imagepath));

    final url = ref.getDownloadURL();
    EasyLoading.showSuccess('Upload Complite');
    return url;
  }
}
