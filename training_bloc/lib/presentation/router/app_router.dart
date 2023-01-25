import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc/presentation/screens/home_screen.dart';
import 'package:training_bloc/presentation/screens/second_screen.dart';
import 'package:training_bloc/presentation/screens/third_screen.dart';

import '../../logic/cubit/counter_cubit.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(color: Colors.blueAccent, title: 'Homescreen'),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child:
                SecondScreen(color: Colors.redAccent, title: 'Second screen'),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child:
                ThirdScreen(color: Colors.greenAccent, title: 'Third screen'),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
