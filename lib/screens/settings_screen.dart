import 'package:flutter/material.dart';
import '../components/main_drawer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: MainDrawer(key: key),
      body: const Center(
        child: Text('Configurações'),
      ),
    );
  }
}
