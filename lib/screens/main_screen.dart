import 'package:flutter/material.dart';
import 'package:henkin_meals/components/main_drawer.dart';
import 'package:henkin_meals/models/meal.dart';
import 'package:henkin_meals/screens/categories_screen.dart';
import 'package:henkin_meals/screens/favorites_screen.dart';

class Screen {
  final String title;
  final Widget screen;

  Screen({
    required this.title,
    required this.screen,
  });
}

class MainScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const MainScreen(this.favoriteMeals);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Screen> screens = [];

  _changeScreen(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  initState() {
    super.initState();
    screens = [
      Screen(
        title: 'Todas categorias',
        screen: CategoriesScreen(),
      ),
      Screen(
        title: 'Meus favoritos',
        screen: FavoritesScreen(widget.favoriteMeals),
      ),
    ];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[_selectedIndex].title),
      ),
      drawer: MainDrawer(),
      body: screens[_selectedIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor:
            Theme.of(context).primaryTextTheme.headline6!.color,
        onTap: _changeScreen,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
