import 'package:flutter/material.dart';
import 'package:relaxon/src/views/home/home2_page.dart';
import 'package:relaxon/src/views/home/home_page.dart';

class Relaxon extends StatefulWidget {
  const Relaxon({super.key});

  @override
  State<Relaxon> createState() => _RelaxonState();
}

class _RelaxonState extends State<Relaxon> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relaxon',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue.shade900,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue.shade900,
      ),
      themeMode: ThemeMode.system,
      home: const Home2Page(),
    );
  }
}
