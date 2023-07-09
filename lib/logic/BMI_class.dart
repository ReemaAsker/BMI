import 'dart:math';

class Bmi {
  Bmi({required this.height, required this.weight});

  int height = 0;
  int weight = 0;

  double _bmi = 0;

  double calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. ';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower than normal body weight. ';
    }
  }
}
