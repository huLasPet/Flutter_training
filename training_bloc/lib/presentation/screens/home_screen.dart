import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc/logic/cubit/counter_cubit.dart';
import 'package:training_bloc/logic/cubit/internet_cubit.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.color, required this.title});

  final String title;
  Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<InternetCubit, InternetState>(
                builder: (newContext, newState) {
                  return Text(newState.connectionType.name.toString());
                },
                listener: (newContext, newState) {}),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title} #1'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/second');
/*
//Leaving this here as an example
              Navigator.of(context).push(
                MaterialPageRoute(
                  //DONT HAVE CONTEXT IN THE BUILDER AS THAT WILL MESS WITH THE CONTEXT IN THE VALUE
                  builder: (newContext) => BlocProvider.value(
                    value: BlocProvider.of<CounterCubit>(context),
                    child: SecondScreen(
                        title: 'Second screen', color: Colors.redAccent),
                  ),
                ),
              );
*/
              },
              child: const Text('Second screen'),
            )
          ],
        ),
      ),
    );
  }
}
