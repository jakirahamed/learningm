import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningm/page/add_product/product_model.dart';

final prductserviceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

class ProductService {
  final titleController = TextEditingController();
  final authernameController = TextEditingController();
  final priceController = TextEditingController();
  final courseSubtitleController = TextEditingController();
  final whatLearnController = TextEditingController();
  final courseIncludesController = TextEditingController();
  final requirementsController = TextEditingController();
  final descriptionController = TextEditingController();

  addProduct(String url, String? categoris) async {
    if (titleController.text.isEmpty) {
      EasyLoading.showToast('Enter Title');
    } else if (authernameController.text.isEmpty) {
      EasyLoading.showToast('Author name empty');
    } else if (priceController.text.isEmpty) {
      EasyLoading.showToast('Enter Price ');
    } else if (courseSubtitleController.text.isEmpty) {
      EasyLoading.showToast('Enter Subtitle');
    } else if (whatLearnController.text.isEmpty) {
      EasyLoading.showToast("What You'll Learn field empty");
    } else if (courseIncludesController.text.isEmpty) {
      EasyLoading.showToast('Includes file emplty');
    } else if (requirementsController.text.isEmpty) {
      EasyLoading.showToast('Requirement empty');
    } else if (descriptionController.text.isEmpty) {
      EasyLoading.showToast('Enter Description');
    } else if (categoris == null) {
      EasyLoading.showToast('categories is empty');
    } else {
      final model = ProductModel(
        title: titleController.text,
        authername: authernameController.text,
        rating: 0.0,
        price: int.parse(priceController.text),
        courseSubtitle: courseSubtitleController.text,
        date: Timestamp.now(),
        whatLearn: whatLearnController.text,
        courseIncludes: courseIncludesController.text,
        requirements: requirementsController.text,
        description: descriptionController.text,
        img: url,
        categories: categoris,
      );
      EasyLoading.show();
      final firebase = FirebaseFirestore.instance;
      final ref = firebase.collection('course');
      await ref.add(model.toMap());
      titleController.clear();
      authernameController.clear();
      priceController.clear();
      courseSubtitleController.clear();
      whatLearnController.clear();
      courseIncludesController.clear();
      requirementsController.clear();
      descriptionController.clear();
      EasyLoading.showSuccess('Done');
    }
  }
}

final catagorisListProvider = Provider<List<String>>((ref) {
  return ["Featured", "Design", "Development", "Marketing"];
});

final selectedCategorisProvider = StateProvider<String?>((ref) {
  return null;
});
