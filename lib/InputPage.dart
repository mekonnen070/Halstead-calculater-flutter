// ignore_for_file: non_constant_identifier_names, file_names

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:halstead_calculator_for_metrics_group_work/HalsteadCalcProvider.dart';
import 'package:provider/provider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  List<Color> mainColors = const [
    Color(0xFF764BA2),
    Color(0xFF667EEA),
  ];
  late TextEditingController _n1Controller;
  late TextEditingController _N1Controller;
  late TextEditingController _n2Controller;
  late TextEditingController _N2Controller;

  double? height;
  double? width;

  @override
  void initState() {
    super.initState();
    _n1Controller = TextEditingController();
    _N1Controller = TextEditingController();
    _n2Controller = TextEditingController();
    _N2Controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _n1Controller.dispose();
    _N1Controller.dispose();
    _n2Controller.dispose();
    _N2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HalsteadCalcProvider>(
      builder: (context, halsProvider, _) {
        return SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF11998E),
                    Color(0xFF38EF7D),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Input',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Distinct operators (n1):',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          // height: 40,
                          child: TextFormField(
                            controller: _n1Controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return validator(value);
                            },
                            onSaved: (value) {
                              halsProvider.n1 =
                                  double.parse(_n1Controller.text);
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.0),
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Enter n1',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              errorStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Total operators (N1):',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          // height: 40,
                          child: TextFormField(
                            controller: _N1Controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return validator(value);
                            },
                            onSaved: (value) {
                              halsProvider.N1 =
                                  double.parse(_N1Controller.text);
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.0),
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              labelText: 'Enter N1',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              errorStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Distinct operands (n2):',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          // height: 40,
                          child: TextFormField(
                            controller: _n2Controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return validator(value);
                            },
                            onSaved: (value) {
                              // _formKey.currentState!.validate();
                              halsProvider.n2 =
                                  double.parse(_n2Controller.text);
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12.0),
                                fillColor: Colors.white70,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Enter n2',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                errorStyle: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Total operands (N2):',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _N2Controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return validator(value);
                            },
                            onSaved: (value) {
                              // _formKey.currentState!.validate();
                              halsProvider.N2 =
                                  double.parse(_N2Controller.text);
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12.0),
                                fillColor: Colors.white70,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Enter N2',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                errorStyle: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: calculateButton(halsProvider),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  calculateButton(HalsteadCalcProvider halsProvider) {
    return Card(
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
          child: const Text(
            'Calculate',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            bool _allValidated = _formKey.currentState!.validate();
            if (_allValidated) {
              halsProvider.isvalidatedSetter(true);
            }
            _formKey.currentState!.save();
          },
        ),
      ),
    );
  }

  validator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a positive number.';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Enter a valid number';
    } else {
      return null;
    }
  }
}
