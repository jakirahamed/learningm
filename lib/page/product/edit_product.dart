import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningm/service/add_product_service.dart';

class EditProduct extends ConsumerWidget {
  const EditProduct({Key? key}) : super(key: key);
  static const String routeName = '/editproduct';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productservice = ref.watch(prductserviceProvider);
    final categoryList = ref.watch(catagorisListProvider);
    final category = ref.watch(selectedCategorisProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: productservice.titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.authernameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Enter Author Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Enter Price'),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text('Select Categorey'),
                    isExpanded: true,
                    value: category,
                    items: categoryList
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      ref.read(selectedCategorisProvider.state).state = v;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.courseSubtitleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Enter Course Subtitle',
              ),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.whatLearnController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "What You'll Learn",
              ),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.courseIncludesController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Includes File",
              ),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.requirementsController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Requirement",
              ),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: productservice.descriptionController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
