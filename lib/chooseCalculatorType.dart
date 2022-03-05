// ignore_for_file: must_be_immutable

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:halstead_calculator_for_metrics_group_work/dynamicCaclulator.dart';
import 'package:halstead_calculator_for_metrics_group_work/main.dart';

class ChooseCalculatorType extends StatelessWidget {
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3700b3),
        title: const Text(MyApp.title),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF764BA2),
                Color(0xFF667EEA),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Text('How do you like to do Halstead calculator?',
                style: const TextStyle(color: Colors.black87, fontSize: 20)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF764BA2),
                            Color(0xFF667EEA),
                          ],
                        ),
                      ),
                      child: AnimatedButton(
                        color: Colors.transparent,
                        height: height! * 0.075,
                        width: width! * 0.40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
                        },
                        child: const Text(
                          'Static',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Card(
                    elevation: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF764BA2),
                            Color(0xFF667EEA),
                          ],
                        ),
                      ),
                      child: AnimatedButton(
                        color: Colors.transparent,
                        height: height! * 0.075,
                        width: width! * 0.40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DynamicCalculator()));
                        },
                        child: const Text(
                          'Dynamic',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
