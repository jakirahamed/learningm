import 'package:flutter/material.dart';
import 'package:learningm/page/add_product/add_product.dart';
import 'package:learningm/page/bottom_nav.dart';
import 'package:learningm/page/flash/flash.dart';
import 'package:learningm/page/home/deshboard.dart';
import 'package:learningm/page/order/order.dart';
import 'package:learningm/page/product/all_product.dart';
import 'package:learningm/page/product/edit_product.dart';
import 'package:learningm/page/product/product_details.dart';
import 'package:learningm/page/search/search.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case BottomNavBar.routeName:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case Deshboard.routeName:
        return MaterialPageRoute(
          builder: (context) => const Deshboard(),
        );
      case Orderpage.routeName:
        return MaterialPageRoute(
          builder: (context) => const Orderpage(),
        );
      case AllProductPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AllProductPage(),
        );
      case AddProduct.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddProduct(),
        );
      case FlashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const FlashPage(),
        );
      case SearchPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      case EditProduct.routeName:
        return MaterialPageRoute(
          builder: (context) => const EditProduct(),
        );
      case ProductDetails.routeName:
        if (arg is String) {
          return MaterialPageRoute(
            builder: (context) => ProductDetails(arg),
          );
        } else {
          return error();
        }
      // case NoteInfo.routename:
      //   if (arg is NoteModel) {
      //     return MaterialPageRoute(
      //       builder: (context) => NoteInfo(noteModel: arg),
      //     );
      //   } else {
      //     return error();
      //   }

      default:
        return error();
    }
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text("error")),
      ),
    );
  }
}
