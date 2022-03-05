import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:halstead_calculator_for_metrics_group_work/HalsteadCalcProvider.dart';
import 'package:halstead_calculator_for_metrics_group_work/OutputPage.dart';
import 'package:halstead_calculator_for_metrics_group_work/main.dart';
// import 'package:halstead_calculator_for_metrics_group_work/dynamicProvider.dart';
import 'package:provider/provider.dart';

class DynamicCalculator extends StatefulWidget {
  const DynamicCalculator({Key? key}) : super(key: key);

  @override
  State<DynamicCalculator> createState() => _DynamicCalculatorState();
}

class _DynamicCalculatorState extends State<DynamicCalculator> {
  TextEditingController? _controller;
  double? height;
  double? width;

  HalsteadCalcProvider? provider;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    provider = Provider.of<HalsteadCalcProvider>(context, listen: false);
  }

  bool calculatPressed = false;

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.refresh_outlined,
              ),
              onPressed: () {
                Phoenix.rebirth(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                ' Be sure to have an internet connection.\n Please input the code here:',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green)),
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  maxLines: 6,
                  minLines: 3,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                height: height! * 0.075,
                width: width! * 0.40,
                onPressed: () {
                  provider!.dynamicCaclulatorMethod(_controller!.text);
                  setState(() {
                    calculatPressed = true;
                  });
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              if (_controller!.text.isNotEmpty && calculatPressed == true)
                provider!.programVocabulary == 0
                    ? const CircularProgressIndicator.adaptive()
                    : const OutputScreen()
            ],
          ),
        ),
      ),
    );
  }
}
