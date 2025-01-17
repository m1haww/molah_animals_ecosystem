class Ecosystem {
  final String title;
  final String description;
  Ecosystem({required this.title, required this.description});
  Predator? predator;
  Victim? victim;
  Connection? connection;
  Animals? animals;
  AddAnimal? addAnimal;
}

class Predator {
  final String name;
  final String habitat;
  final String description;
  final String food;
  final String type;
  Predator(
      {required this.name,
      required this.habitat,
      required this.description,
      required this.food,
      required this.type});
}

class Victim {
  final String name;
  final String habitat;
  final String description;
  final String food;
  final String type;
  Victim(
      {required this.name,
      required this.habitat,
      required this.description,
      required this.food,
      required this.type});
}

class Connection {
  final String connection;
  Connection({required this.connection});
}

class Animals {
  final String name;
  final String type;
  final String optional;
  final String date;

  Animals(
      {required this.name,
      required this.type,
      required this.optional,
      required this.date});
}

class Profile {
  final String name;
  final String surname;
  final String image;

  Profile({required this.name, required this.surname, required this.image});
}

class AddAnimal {
  final String name;
  final String type;
  final String optional;
  final String birth;

  AddAnimal(
      {required this.name,
      required this.type,
      required this.optional,
      required this.birth});
}
