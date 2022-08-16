import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editserviceProvider = Provider<EditProduct>((ref) {
  return EditProduct();
});

class EditProduct {
  final titleController = TextEditingController();
  final authernameController = TextEditingController();
  final priceController = TextEditingController();
  final courseSubtitleController = TextEditingController();
  final whatLearnController = TextEditingController();
  final courseIncludesController = TextEditingController();
  final requirementsController = TextEditingController();
  final descriptionController = TextEditingController();
}
