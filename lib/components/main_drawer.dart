import 'package:flutter/material.dart';
import 'package:henkin_meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    listButton(IconData icon, String title, String route) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
      );
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).colorScheme.secondary,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: FittedBox(
                  child: Text(
                    'Vamos cozinhar?',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Divider(thickness: 2),
                listButton(Icons.restaurant, 'Refeições', AppRoutes.home),
                const Divider(thickness: 2),
                listButton(Icons.settings, 'Configurações', AppRoutes.settings),
                const Divider(thickness: 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
