import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  final height;
  final weight;

  double? _bmi; //private variable

  CalculatorBrain({required this.height, required this.weight});

  // ignore: missing_return
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // BMI FORMULA = w/h2
    return _bmi!.toStringAsFixed(1); // this returns as decimal-point-string
  }

  // ignore: missing_return
  String getResults() {
    if (_bmi! >= 25) {
      //greater or equal to
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      //greater than
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // ignore: missing_return
  String getInterpretation() {
    if (_bmi! >= 25) {
      //greater or equal to
      return 'You have a higher than normal body weight. Try to Exercise more.';
    } else if (_bmi! > 18.5) {
      //greater than
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
