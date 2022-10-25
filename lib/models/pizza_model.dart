import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

CircleAvatar mixpizza = const CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage('images/mixpizza.png'),
);

CircleAvatar tomatopizza = const CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage('images/tomatopizza.png'),
);

class Pizza extends Equatable {

  final CircleAvatar image;

  const Pizza({required this.image});

  @override
  List<Object?> get props => [image];

  static Pizza mixpizzas = Pizza(image: mixpizza);
  static Pizza tomatopizzas =
      Pizza(image: tomatopizza);
}
