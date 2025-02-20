import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:jeepneyfornoobs_flutter/screens/maps_screen.dart';
import 'package:jeepneyfornoobs_flutter/screens/routes_screen.dart';
import 'package:jeepneyfornoobs_flutter/screens/settings_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Maps",
          baseStyle: const TextStyle(color: Colors.white, fontSize: 16),
          selectedStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        MapsScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Routes",
          baseStyle: const TextStyle(color: Colors.white, fontSize: 16),
          selectedStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        RoutesScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle: const TextStyle(color: Colors.white, fontSize: 16),
          selectedStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color(0xFF282931),
      backgroundColorAppBar: Colors.transparent, // Transparent AppBar
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60.0,
      contentCornerRadius: 0.0,
      elevationAppBar: 0.0, // Remove shadow
      withAutoTittleName: false, // Removes title from AppBar
      leadingAppBar: const Icon(
        Icons.menu,
        color: Colors.black, // Black hamburger icon
      ),
    );
  }
}
