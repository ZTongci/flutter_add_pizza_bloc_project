import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(initialState(pizzas: const [])) {
    on<AddPizza>((event, emit)
        // async
        {
      emit(initialState(pizzas: List.from(state.pizzas)..add(event.pizza)));
      // List<Pizza> pizzaList = await state.pizzas;
      // pizzaList.add(event.pizza);
      // emit(initialState(pizzas: pizzaList));
    });
    on<RemovePizza>((event, emit) {
      emit(initialState(pizzas: List.from(state.pizzas)..remove(event.pizza)));
    });
  }
}
