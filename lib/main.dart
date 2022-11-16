import 'package:flutter/material.dart';
import 'package:foodapp/models/settings.dart';
import 'package:foodapp/screens/categories_meals_screen.dart';

import 'package:foodapp/screens/meal_detail_screen.dart';
import 'package:foodapp/screens/settings_screen.dart';
import './utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      availableMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return favoriteMeals.contains(meal);
  }

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
        AppRoutes.home: (context) => TabsScreen(favoriteMeals: favoriteMeals),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(
              meals: availableMeals,
            ),
        AppRoutes.mealDetail: ((context) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite)),
        AppRoutes.settings: ((context) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ))
      },
    );
  }
}
