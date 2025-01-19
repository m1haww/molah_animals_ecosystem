import 'package:flutter/material.dart';
import 'package:molah_animals_ecosystem/models/functions/ecosystem.dart';

class EcosystemProvider extends ChangeNotifier {
  final List<Predator> _predators = [];
  final List<Victim> _victims = [];
  final List<Ecosystem> _ecosystems = [];
  final List<AddAnimal> _addanimals = [];
  final List<EventsAnimal> _eventsanimal = [];
  final List<Profile> _profile = [];
  // Getters
  List<Predator> get predators => _predators;
  List<Victim> get victims => _victims;
  List<Ecosystem> get ecosystems => _ecosystems;
  List<AddAnimal> get addanimal => _addanimals;
  List<EventsAnimal> get eventsanimal => _eventsanimal;
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

  void addAddAnimal(AddAnimal addanimal) {
    _addanimals.add(addanimal);
    notifyListeners();
  }

  void addEventsAnimal(EventsAnimal eventsanimal) {
    _eventsanimal.add(eventsanimal);
    notifyListeners();
  }

  void addProfile(Profile profile) {
    _profile.add(profile);
    notifyListeners();
  }
}
