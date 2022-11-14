import 'package:flutter/material.dart';
import 'package:foodapp/models/category.dart';

import 'package:foodapp/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  void _selectedCategory(BuildContext context) {
    //Fazendo a navegação para a tela já passando o objeto category para ser acessado lá na outra página, ou seja, j´´a passamos com as informações.

    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoriesMealsScreen(category);
    // }));

    Navigator.of(context).pushNamed(
      AppRoutes.categoriesMeals,
      arguments: category,
    );
  }

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.15),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
