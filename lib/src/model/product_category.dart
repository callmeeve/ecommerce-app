import 'package:e_commerce/src/model/product.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  String name;

  ProductCategory(this.type, this.isSelected, this.name);
}
