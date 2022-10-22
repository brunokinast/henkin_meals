import 'package:flutter/material.dart';
import 'package:henkin_meals/data/dummy_data.dart';
import 'package:henkin_meals/models/meal.dart';
import 'package:henkin_meals/models/settings.dart';
import 'package:henkin_meals/screens/category_meals_screen.dart';
import 'package:henkin_meals/screens/main_screen.dart';
import 'package:henkin_meals/screens/meal_details_screen.dart';
import 'package:henkin_meals/screens/settings_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  _settingsChanged(Settings settings) {
    this.settings = settings;
    _availableMeals = dummyMeals.where((meal) {
      return !(settings.isGlutenFree && !meal.isGlutenFree) &&
          !(settings.isLactoseFree && !meal.isLactoseFree) &&
          !(settings.isVegan && !meal.isVegan) &&
          !(settings.isVegetarian && !meal.isVegetarian);
    }).toList();
  }

  _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Henkin Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      routes: {
        AppRoutes.home: (_) => MainScreen(_favoriteMeals),
        AppRoutes.categoryMeals: (_) => CategoryMealsScreen(_availableMeals),
        AppRoutes.mealDetails: (_) =>
            MealDetailsScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (_) => SettingsScreen(_settingsChanged, settings),
      },
    );
  }
}
