import 'package:flutter/material.dart';
import 'package:flutter_add_pizza_bloc_project/bloc/pizza_bloc.dart';
import 'package:flutter_add_pizza_bloc_project/debug/debug.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math';
import 'models/pizza_model.dart';

void main() {
  Bloc.observer = Myappblocobserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PizzaBloc>(
      create: (_) => PizzaBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('pizza bloc'),
            centerTitle: true,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: BlocBuilder<PizzaBloc, PizzaState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context
                          .read<PizzaBloc>()
                          .add(AddPizza(pizza: Pizza.mixpizzas));
                      print(BlocProvider.of(context));
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context
                          .read<PizzaBloc>()
                          .add(RemovePizza(pizza: Pizza.mixpizzas));
                    },
                    child: const Icon(Icons.minimize_rounded),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context
                          .read<PizzaBloc>()
                          .add(AddPizza(pizza: Pizza.tomatopizzas));
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context
                          .read<PizzaBloc>()
                          .add(RemovePizza(pizza: Pizza.tomatopizzas));
                    },
                    child: const Icon(Icons.minimize_rounded),
                  ),
                ],
              );
            },
          ),
          body: Center(
            child: BlocBuilder<PizzaBloc, PizzaState>(
              builder: (context, state) {
                if (state is PizzaState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.pizzas.length}'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            for (int index = 0;
                                index < state.pizzas.length;
                                index++)
                              Positioned(
                                  left: Random().nextInt(250).toDouble(),
                                  top: Random().nextInt(400).toDouble(),
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: state.pizzas[index].image,
                                  ))
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Text('Something went wrong!');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
