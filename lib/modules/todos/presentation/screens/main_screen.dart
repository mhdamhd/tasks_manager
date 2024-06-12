import 'package:flutter/material.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/core/constants/app_gradient.dart';
import 'package:tasksmanager/core/constants/app_shadow.dart';
import 'package:tasksmanager/core/core_compoent/app_scaffold.dart';
import 'package:tasksmanager/modules/todos/presentation/screens/todos_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void changeScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home_filled),
        label: "Todos",
        backgroundColor: Colors.transparent
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        activeIcon: Icon(Icons.favorite),
        label: "Sc2",
        backgroundColor: Colors.transparent
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.alarm_add_outlined),
        activeIcon: Icon(Icons.alarm_add),
        label: "Sc3",
        backgroundColor: Colors.transparent),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: "Sc4",
        backgroundColor: Colors.transparent),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: "Sc5",
        backgroundColor: Colors.transparent),
  ];

  final List screens = [
    TodosScreen(),
    const Center(child: Text("Second Screen"),),
    const Center(child: Text("Third Screen"),),
    const Center(child: Text("Fourth Screen"),),
    const Center(child: Text("Fifth Screen"),),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.blackGradient,
            boxShadow: [AppShadows.blackShadow],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.white,
            currentIndex: currentIndex,
            elevation: 0,
            items: bottomNavBarItems,
            onTap: changeScreen,
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
