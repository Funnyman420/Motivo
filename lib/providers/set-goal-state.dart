import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class SetGoalState extends ChangeNotifier {
  final _goalKey = GlobalKey<FormState>();
  final _goalTitleController = TextEditingController();
  var _numericGoalRangeValues = RangeValues(0, 0);
  var _numericGoalValue = 0.0;
  var _messageFriends = false;
  //Future<Iterable<Contact>> _contactListFuture;
  Map<Contact, bool> _selectedContacts;

  // Getters
  GlobalKey<FormState> get goalKey => _goalKey;
  TextEditingController get goalTitleController => _goalTitleController;
  RangeValues get numericGoalRangeValues => _numericGoalRangeValues;
  double get numericGoalValue => _numericGoalValue;
  bool get messageFriends => _messageFriends;
  Map<Contact, bool> get selectedContacts => _selectedContacts;

  onGoalRangeState(RangeValues rangeValues) {
    _numericGoalRangeValues = rangeValues;
    notifyListeners();
  }

  

  onGoalValueChanged(double goalValue) {
    _numericGoalValue = goalValue;
    if (_goalTitleController.text.contains("\$"))
      _goalTitleController.text = _goalTitleController.text
          .replaceFirst("\$", _numericGoalValue.toInt().toString());
    else if (_goalTitleController.text.contains(RegExp(r"\d+")))
      _goalTitleController.text = _goalTitleController.text
          .replaceAll(new RegExp(r"\d+"), "${_numericGoalValue.toInt()}");

    notifyListeners();
  }

  setContacts(Iterable<Contact> contacts) {
    _selectedContacts = {for (var c in contacts) c: false};
  }

  Goal getGoal() {
    final goaltitle = _goalTitleController.text;
    var numericGoalString = RegExp(r"\d+").allMatches(_goalTitleController.text).first.group(0);
    
    return Goal(goalId: -1,numericCurrent: 0, numericGoal: int.parse(numericGoalString), title: goaltitle);
  }

  onMessageFriendsChanged(bool value) {
    _messageFriends = value;
    notifyListeners();
  }

  onContactSelected(Contact contact, bool value) {
    _selectedContacts[contact] = value;
    notifyListeners();
  }
}
