import 'package:flutter/widgets.dart';
import 'package:foodapp/components/meal_item.dart';
import 'package:foodapp/models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavouriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
          child: Text('Nenhuma refeição foi marcada como favorita.'));
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) =>
              MealItem(meal: favoriteMeals[index]));
    }
  }
}
