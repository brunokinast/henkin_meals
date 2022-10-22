import 'package:flutter/material.dart';
import 'package:henkin_meals/components/meal_item.dart';
import 'package:henkin_meals/components/screen_empty_text.dart';
import 'package:henkin_meals/models/category.dart';
import 'package:henkin_meals/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> _allMeals;

  const CategoryMealsScreen(this._allMeals);

  @override
  Widget build(BuildContext context) {
    final Category cat = ModalRoute.of(context)!.settings.arguments as Category;
    final List<Meal> meals =
        _allMeals.where((meal) => meal.categories.contains(cat.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.title),
      ),
      body: meals.isEmpty
          ? const ScreenEmptyText(
              'Nenhuma refeição encontrada :(', 'Verifique seus filtros!')
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, i) {
                return MealItem(meals[i]);
              },
            ),
    );
  }
}
