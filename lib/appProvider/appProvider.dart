import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class EcosystemProvider extends ChangeNotifier {
  final List<Predator> _predators = [];
  final List<Victim> _victims = [];
  final List<Ecosystem> _ecosystems = [];
  final List<Animals> _animals = [];
  final List<AddAnimal> _addanimals = [];
  // Getters
  List<Predator> get predators => _predators;
  List<Victim> get victims => _victims;
  List<Ecosystem> get ecosystems => _ecosystems;
  List<Animals> get animals => _animals;
  List<AddAnimal> get addanimal => _addanimals;
  Profile? profile;
  // Methods to manage Predators
  void addPredator(Predator predator) {
    _predators.add(predator);
    notifyListeners();
  }

  void removePredator(int index) {
    _predators.removeAt(index);
    notifyListeners();
  }

  // Methods to manage Victims
  void addVictim(Victim victim) {
    _victims.add(victim);
    notifyListeners();
  }

  void removeVictim(int index) {
    _victims.removeAt(index);
    notifyListeners();
  }

  // Methods to manage Ecosystem
  void addEcosystem(Ecosystem ecosystem) {
    _ecosystems.add(ecosystem);
    notifyListeners();
  }

  void clearEcosystem() {
    _ecosystems.clear();
    notifyListeners();
  }

  // Methods to manage Animals
  void addAnimals(Animals animals) {
    _animals.add(animals);
    notifyListeners();
  }
}
