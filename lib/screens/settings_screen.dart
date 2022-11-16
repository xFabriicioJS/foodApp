import 'package:flutter/material.dart';
import 'package:foodapp/models/settings.dart';

import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  final Settings settings;
  const SettingsScreen(
      {super.key, required this.onSettingsChanged, required this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    dynamic onChange,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChange(value);

        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch('Sem glúten', 'Só exibe refeições sem glúten!',
                  settings.isGlutenFree, (value) {
                setState(() {
                  settings.isGlutenFree = value;
                });
              }),
              _createSwitch('Sem lactose', 'Só exibe refeições sem lactose!',
                  settings.isLactoseFree, (value) {
                setState(() {
                  settings.isLactoseFree = value;
                });
              }),
              _createSwitch(
                  'Vegana', 'Só exibe refeições veganas!', settings.isVegan,
                  (value) {
                setState(() {
                  settings.isVegan = value;
                });
              }),
              _createSwitch('Vegatariano', 'Só exibe refeições vegetarianas!',
                  settings.isVegetarian, (value) {
                setState(() {
                  settings.isVegetarian = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
