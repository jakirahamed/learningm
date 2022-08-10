import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningm/service/add_product_service.dart';
import '../../service/image_service.dart';
import '../../theme/theme.dart';

class AddProduct extends ConsumerWidget {
  const AddProduct({Key? key}) : super(key: key);
  static const String routeName = '/addproduct';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productservice = ref.watch(prductserviceProvider);
    final image = ref.watch(imageServiceProvider);
    final imageservice = ref.read(imageServiceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final url = await imageservice.uplodeImg(
            path: "course",
            filename: productservice.titleController.text,
            imagepath: image.first,
          );
          productservice.addProduct(url);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: boxdecoretion,
                    child: IconButton(
                      onPressed: () {
                        imageservice.addImage();
                      },
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (image.isNotEmpty)
                    Stack(
                      children: [
                        Card(
                          child: Image.file(
                            File(image.first),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              imageservice.clear();
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      ],
                    )
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productservice.titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: 'Enter Title'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productservice.authernameController,
                keyboardType: TextInputType.text,
                decoration:
                    const InputDecoration(hintText: 'Enter Author Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productservice.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Enter Price'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
      ),
    );
  }
}
