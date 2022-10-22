import 'package:flutter/material.dart';
import 'package:henkin_meals/components/meal_item.dart';
import 'package:henkin_meals/components/screen_empty_text.dart';
import 'package:henkin_meals/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> meals;

  const FavoritesScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? const ScreenEmptyText(
            'Nenhuma refeição favorita :(',
            'Adicione refeições ao seus favoritos!',
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, i) {
              return MealItem(meals[i]);
            },
          );
  }
}
