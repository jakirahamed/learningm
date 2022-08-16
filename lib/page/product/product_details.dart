import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningm/page/product/edit_product.dart';
import 'package:learningm/page/product/show_product.dart';

import '../../widget/network_img.dart';

class ProductDetails extends ConsumerWidget {
  const ProductDetails(this.id, {Key? key}) : super(key: key);
  static const String routeName = 'productdetails';
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productinfo = ref.watch(singleProductProvider(id));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProduct.routeName);
            },
            icon: const Icon(Icons.edit_note_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: productinfo.when(
                data: (productIn) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: KCachedImg(imageUrl: productIn.img),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      productIn.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(productIn.courseSubtitle),
                    Text('Created by ${productIn.authername}'),
                    Text(productIn.date.toString()),
                    const SizedBox(height: 10),
                    Text(productIn.courseIncludes),
                    Text(productIn.whatLearn),
                    Text(productIn.requirements),
                    Text(productIn.description),
                  ],
                ),
                error: (error, stackTrace) => Text("Error$error"),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    child: const Text('Add To Cart'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
