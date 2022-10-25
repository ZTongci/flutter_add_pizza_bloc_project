part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  final List<Pizza> pizzas;

  PizzaState({required this.pizzas});
  @override
  List<Object> get props => [pizzas];
}

class initialState extends PizzaState {

  initialState({required super.pizzas});
}
