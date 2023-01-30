import 'dart:ui';
import 'package:flutter/material.dart';

class Historymodel {
  final Color color;
  final String name, location, sex, image;
  final double age, weight;
  final int distance;

  Historymodel({
    required this.image,
    required this.color,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
  });
}

List<Historymodel> historyData = [
  Historymodel(
    color: Colors.blue,
    name: 'Leo',
    location: 'Dumai, Riau',
    sex: 'Male',
    age: 2.1,
    weight: 4.5,
    image: 'assets/pets/pets10.png',
    distance: 7,
  ),
  Historymodel(
    color: Colors.green,
    name: 'Lily',
    location: 'Siak, Riau',
    sex: 'Female',
    age: 1.2,
    image: 'assets/pets/pets9.png',
    weight: 2.6,
    distance: 5,
  ),
  Historymodel(
    color: Colors.blue,
    name: 'Cleo',
    image: 'assets/pets/pets8.png',
    location: 'Pekanbaru, Riau',
    sex: 'Male',
    age: 1.4,
    weight: 3.4,
    distance: 7,
  ),
  Historymodel(
    color: Colors.redAccent,
    image: 'assets/pets/pets7.png',
    name: 'Milo',
    location: 'Kampar, Riau',
    sex: 'Female',
    age: 1.1,
    weight: 3.2,
    distance: 11,
  ),
];
