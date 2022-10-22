import 'package:flutter/material.dart';
import 'package:henkin_meals/components/icon_text.dart';
import 'package:henkin_meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function(Meal) toggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _sectionList(BuildContext context, double height, ListView list) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).primaryColor,
      ),
      child: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(meal),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10,
                runSpacing: 5,
                children: [
                  IconText(
                    const Icon(Icons.access_time),
                    '${meal.duration} min',
                  ),
                  IconText(
                    const Icon(Icons.work_outline),
                    meal.complexityText,
                  ),
                  IconText(
                    const Icon(Icons.attach_money),
                    meal.costText,
                  ),
                  IconText(
                    const Icon(Icons.grain_outlined),
                    '${meal.isGlutenFree ? 'Não contém' : 'Contém'} glúten',
                  ),
                  if (meal.isVegan || meal.isVegetarian)
                    IconText(
                      const Icon(Icons.fastfood_outlined),
                      meal.isVegan ? 'Vegano' : 'Vegetariano',
                    ),
                  IconText(
                    const Icon(Icons.free_breakfast_outlined),
                    '${meal.isLactoseFree ? 'Não contém' : 'Contém'} lactose',
                  ),
                ],
              ),
            ),
            _sectionTitle(context, 'Ingredientes'),
            _sectionList(
                context,
                200,
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, i) {
                      return Card(
                        elevation: 5,
                        color:
                            Theme.of(context).primaryTextTheme.headline6!.color,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            ' - ${meal.ingredients[i]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    })),
            _sectionTitle(context, 'Passos'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _sectionList(
                context,
                400,
                ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('${i + 1}'),
                            ),
                            title: Text(
                              meal.steps[i],
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6!
                                    .color,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6!
                                .color,
                            thickness: 2,
                          )
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
