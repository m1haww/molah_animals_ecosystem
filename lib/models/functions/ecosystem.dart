class Ecosystem {
  final String title;
  final String description;
  Predator? predator = null;
  Ecosystem({required this.title, required this.description});
  Victim? victim = null;
  Connection? connection = null;
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
