import 'package:flutter/material.dart';
import 'package:training_bloc/presentation/screens/home_screen.dart';
import 'package:training_bloc/presentation/screens/second_screen.dart';
import 'package:training_bloc/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              HomeScreen(color: Colors.blueAccent, title: 'Homescreen'),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(color: Colors.redAccent, title: 'Second screen'),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(color: Colors.greenAccent, title: 'Third screen'),
        );
      default:
        return null;
    }
  }
}
