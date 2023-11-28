import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:e_commerce/core/app_data.dart';
import 'package:e_commerce/src/model/product.dart';
// import 'package:e_commerce/src/model/numerical.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce/src/model/product_category.dart';
// import 'package:e_commerce/src/model/product_size_type.dart';

class ProductController extends GetxController {
  List<Product> allProducts = AppData.products;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  var totalPrice = RxInt(0);

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    update();
  }

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    update();
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addToCart(Product product, BuildContext context) {
    // Increment the quantity of the product
    product.quantity++;

    // Check if the product is already in the cart
    final existingProductIndex =
        cartProducts.indexWhere((p) => p.name == product.name);

    if (existingProductIndex != -1) {
      // If the product is already in the cart, update the quantity
      cartProducts[existingProductIndex].quantity++;
    } else {
      // If the product is not in the cart, add it
      cartProducts.add(product);
    }

    // Recalculate the total price
    calculateTotalPrice();

    showSnackbar(context,
        'Added to cart: ${product.name}, Quantity: ${product.quantity}');

    // Print debug information
  }

  void increaseItemQuantity(Product product) {
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(Product product) {
    if (product.quantity > 1) {
      // Ensure the quantity does not go below 1
      product.quantity--;
      calculateTotalPrice();
      update();
    }
  }

  bool isPriceOff(Product product) => product.off != null && product.off! > 0;

  bool get isEmptyCart => cartProducts.isEmpty;

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!;
      } else {
        totalPrice.value += element.quantity * element.price;
      }
    }
  }

  getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((item) => item.isFavorite),
    );
  }

  getCartItems() {
    cartProducts.assignAll(
      allProducts.where((item) => item.quantity > 0),
    );
  }

  getAllItems() {
    filteredProducts.assignAll(allProducts);
  }

  // List<Numerical> sizeType(Product product) {
  //   ProductSizeType? productSize = product.sizes;
  //   List<Numerical> numericalList = [];

  //   if (productSize?.numerical != null) {
  //     for (var element in productSize!.numerical!) {
  //       numericalList.add(Numerical(element.numerical, element.isSelected));
  //     }
  //   }

  //   if (productSize?.categorical != null) {
  //     for (var element in productSize!.categorical!) {
  //       numericalList.add(
  //         Numerical(
  //           element.categorical.name,
  //           element.isSelected,
  //         ),
  //       );
  //     }
  //   }

  //   return numericalList;
  // }

  // void switchBetweenProductSizes(Product product, int index) {
  //   sizeType(product).forEach((element) {
  //     element.isSelected = false;
  //   });

  //   if (product.sizes?.categorical != null) {
  //     for (var element in product.sizes!.categorical!) {
  //       element.isSelected = false;
  //     }

  //     product.sizes?.categorical![index].isSelected = true;
  //   }

  //   if (product.sizes?.numerical != null) {
  //     for (var element in product.sizes!.numerical!) {
  //       element.isSelected = false;
  //     }

  //     product.sizes?.numerical![index].isSelected = true;
  //   }

  //   update();
  // }

  // String getCurrentSize(Product product) {
  //   String currentSize = "";
  //   if (product.sizes?.categorical != null) {
  //     for (var element in product.sizes!.categorical!) {
  //       if (element.isSelected) {
  //         currentSize = "Size: ${element.categorical.name}";
  //       }
  //     }
  //   }

  //   if (product.sizes?.numerical != null) {
  //     for (var element in product.sizes!.numerical!) {
  //       if (element.isSelected) {
  //         currentSize = "Size: ${element.numerical}";
  //       }
  //     }
  //   }
  //   return currentSize;
  // }
}
