// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'dart:math' as math;

import 'package:halstead_calculator_for_metrics_group_work/halsteadDynamicServices.dart';

class HalsteadCalcProvider extends ChangeNotifier {
  // get programLength => programLength;

  HalsteadCalculatorServices _halstead = HalsteadCalculatorServices();
  double? n1;
  double? N1;
  double? n2;
  double? N2;

  dynamicCaclulatorMethod(String code) async {
    if (code.isNotEmpty) {
      var response = await _halstead.dynamicallyPoster(code);
      // print(response.data);
      if (response.statusCode == 200) {
        n1 = response.data['operators'].length.toDouble();
        n2 = response.data['operands'].length.toDouble();

// total operators
        double opratorsSum = 0;
        for (int counter = 0;
            counter < response.data['operators'].length;
            counter++) {
          opratorsSum += (response.data['operators'][counter])['counter'];
        }

// Total operands
        double operandsSum = 0;
        for (int counter = 0;
            counter < response.data['operands'].length;
            counter++) {
          operandsSum += (response.data['operands'][counter])['counter'];
        }

        N1 = opratorsSum.toDouble();
        N2 = operandsSum.toDouble();

        outPutCalculator();
        return true;
      } else {
        return false;
      }
    }
  }

  bool allAreNotNull = false;
  bool _isvalidated = false;
  get isvalidated => _isvalidated;

  isvalidatedSetter(bool isvalidated) {
    _isvalidated = isvalidated;
    notifyListeners();
  }
  // outPutCalculator();

  void setInputValues(
      {required double n1,
      required double N1,
      required double n2,
      required double N2}) {
    this.n1 = n1;
    this.N1 = N1;
    this.n2 = n2;
    this.N2 = N2;
    outPutCalculator();
  }

  double? programLength;
  double? programVocabulary;
  double? programVolume;
  double? programDiifficulty;
  double? programLevel;
  double? programEffort;
  double? programmingTime;
  double? programmingBugs;

  outPutCalculator() {
    programVocabulary = n1! + n2!;
    programLength = N1! + N2!;
    programVolume = (N1! + N2!) + math.log(n1! + n2!);
    programDiifficulty = (N1! / 2) * (N2! / n2!);
    programLevel = 1 / programDiifficulty!;
    programEffort = programVolume! / programLevel!;
    programmingTime = programEffort! / 18;
    programmingBugs = math.pow(programEffort!, (2 / 3)) / 300;
    allAreNotNull = true;
    print(allAreNotNull);
    notifyListeners();
  }

  @override
  notifyListeners();
}
