import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late final _bmi = weight / pow(height / 100, 2);

  String calculateBMI() => _bmi.toStringAsFixed(1);

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Fat as fuck boi';
    } else if (_bmi > 18.5) {
      return 'Chill dude';
    } else {
      return 'Gotta eat some pussy kiddo';
    }
  }
}
