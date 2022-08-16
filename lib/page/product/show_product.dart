import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningm/page/add_product/product_model.dart';

final showProductProvider =
    StreamProvider.autoDispose<List<ProductModel>>((ref) {
  final firebase = FirebaseFirestore.instance;

  final snap = firebase.collection('course').snapshots();
  final showproduct = snap.map(
    (snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromDoc(doc)).toList(),
  );
  return showproduct;
});

final singleProductProvider =
    StreamProvider.family.autoDispose<ProductModel, String>((ref, id) {
  final firebase = FirebaseFirestore.instance;

  final snap = firebase.collection('course').doc(id).snapshots();

  final showproduct = snap.map((doc) => ProductModel.fromDoc(doc));
  return showproduct;
});
