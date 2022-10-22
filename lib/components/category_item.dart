import 'package:flutter/material.dart';
import 'package:henkin_meals/models/category.dart';
import 'package:henkin_meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category cat;

  const CategoryItem(this.cat);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoryMeals,
      arguments: cat,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              cat.color.withOpacity(0.5),
              cat.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          cat.title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
