import 'package:flutter/material.dart';
import 'package:foodapp/screens/categories_meals_screen.dart';

import 'package:foodapp/screens/meal_detail_screen.dart';
import 'package:foodapp/screens/settings_screen.dart';
import './utils/app_routes.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      //background de todo o app
      scaffoldBackgroundColor: const Color.fromARGB(255, 235, 233, 202),
    );

    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: ((context) => const MealDetailScreen()),
        AppRoutes.settings: ((context) => const Settings())
      },
    );
  }
}
