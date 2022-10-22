import 'package:flutter/material.dart';
import 'package:henkin_meals/components/icon_text.dart';
import 'package:henkin_meals/models/meal.dart';
import 'package:henkin_meals/utils/app_routes.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  _openMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.mealDetails,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openMeal(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: meal.imageUrl,
                  ),
                  // Image.network(
                  //   meal.imageUrl,
                  //   height: 250,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.black54,
                    width: 250,
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
