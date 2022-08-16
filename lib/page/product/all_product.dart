import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learningm/page/product/product_details.dart';
import 'package:learningm/page/product/show_product.dart';

import '../../widget/network_img.dart';

class AllProductPage extends ConsumerWidget {
  const AllProductPage({Key? key}) : super(key: key);
  static const String routeName = '/allproduct';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(showProductProvider);
    return Scaffold(
      body: SafeArea(
        child: products.when(
          data: (productlist) => StaggeredGrid.count(
            crossAxisCount: 2,
            children: [
              ...List.generate(
                productlist.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetails.routeName,
                        arguments: productlist[index].id);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: KCachedImg(
                              imageUrl: productlist[index].img,
                              fit: BoxFit.cover,
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            productlist[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ).toList()
            ],
          ),
          error: (error, stackTrace) => Text("Error$error"),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
