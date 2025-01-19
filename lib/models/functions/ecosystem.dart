import 'package:flutter/cupertino.dart';

class Ecosystem {
  final String title;
  final String description;
  Ecosystem({
    required this.title,
    required this.description,
  });
  Predator? predator;
  Victim? victim;
  AddAnimal? addAnimal;
  EventsAnimal? eventsAnimal;
}

class Predator {
  final String name;
  final ImageProvider image;
  final String habitat;
  final String description;
  final String food;
  final String type;
  Predator(
      {required this.name,
      required this.image,
      required this.habitat,
      required this.description,
      required this.food,
      required this.type});
}

class Victim {
  final String name;
  final ImageProvider image;
  final String habitat;
  final String description;
  final String food;
  final String type;
  Victim(
      {required this.name,
      required this.image,
      required this.habitat,
      required this.description,
      required this.food,
      required this.type});
}

class Profile {
  final String name;
  final String surname;
  final ImageProvider image;

  Profile({required this.name, required this.surname, required this.image});
}

class AddAnimal {
  final String name;
  final ImageProvider image;
  final String type;
  final String optional;
  String birth;

  AddAnimal(
      {required this.name,
      required this.image,
      required this.type,
      required this.optional,
      required this.birth});
}

class EventsAnimal {
  final String title;
  final String date;
  final String description;
  final String type;

  EventsAnimal(
      {required this.title,
      required this.date,
      required this.description,
      required this.type});
}
