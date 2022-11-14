import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'categories_screen.dart';
import 'favourite_screens.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;

  final List<Map<String, Object>> screens = const [
    {'title': 'Lista de categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavouriteScreen()}
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[_selectedScreen]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: screens[_selectedScreen]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.copyWith().primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreen,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                label: 'Categorias',
                backgroundColor:
                    Theme.of(context).colorScheme.copyWith().primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: 'Favoritos',
                backgroundColor:
                    Theme.of(context).colorScheme.copyWith().primary)
          ]),
    );
  }
}
