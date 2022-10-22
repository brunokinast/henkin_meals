import 'package:flutter/material.dart';
import 'package:henkin_meals/components/category_item.dart';
import 'package:henkin_meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const double spacingItems = 15;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(spacingItems),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: spacingItems,
        mainAxisSpacing: spacingItems,
      ),
      children: dummyCategories.map((cat) => CategoryItem(cat)).toList(),
    );
  }
}
