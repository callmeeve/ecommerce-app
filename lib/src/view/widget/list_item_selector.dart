import 'package:flutter/material.dart';
import 'package:e_commerce/src/model/product_category.dart';
import 'package:get/get.dart';

class ListItemSelector extends StatefulWidget {
  const ListItemSelector({
    Key? key,
    required this.categories,
    required this.onItemPressed,
  }) : super(key: key);

  final List<ProductCategory> categories;
  final Function(int) onItemPressed;

  @override
  State<ListItemSelector> createState() => _ListItemSelectorState();
}

class _ListItemSelectorState extends State<ListItemSelector> {
  Widget item(ProductCategory item, int index) {
    return Tooltip(
      message: item.type.name.capitalizeFirst,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(left: 5),
        duration: const Duration(milliseconds: 500),
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: item.isSelected == false
              ? const Color(0xFFE5E6E8)
              : const Color(0xFF1750ac),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            widget.onItemPressed(index);
            for (var element in widget.categories) {
              element.isSelected = false;
            }

            item.isSelected = true;
            setState(() {});
          },
          child: Center(
            child: Text(
              item.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: item.isSelected == false
                    ? const Color(0xFFA6A3A0)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (_, index) => item(widget.categories[index], index),
      ),
    );
  }
}
