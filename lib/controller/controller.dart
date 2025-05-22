// controller/product_controller.dart
// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProductController extends GetxController {
  // RxInt to update quantity reactively
  var quantity = 1.obs;

  void shareProductLink(int productId) async {
    final String deepLink = "https://newproducts.com/product?id=$productId";
    print(deepLink);
    final ShareResult result = await SharePlus.instance.share(
      ShareParams(
        text: 'Check out this product:  $deepLink',
        subject: 'Product Link',
      ),
    );
    if (result.status == ShareResultStatus.success) {
      print('Sharing successful');
    } else {
      print('Sharing cancelled or failed');
    }
  }

  // Increase quantity
  void increaseQuantity(int availableStock) {
    if (quantity.value < availableStock) {
      quantity.value++;
    }
  }

  // Decrease quantity
  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  // Reset quantity
  void resetQuantity() {
    quantity.value = 1;
  }
}
