// color 987900
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:halstead_calculator_for_metrics_group_work/HalsteadCalcProvider.dart';
import 'package:provider/provider.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key}) : super(key: key);

  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HalsteadCalcProvider>(
      builder: (context, halsProvider, _) {
        return SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF662D8C),
                    Color(0xAAED1E79),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Text(
                      'Output',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  cardBuilder(
                    title: 'Program Length:',
                    value: halsProvider.programLength ?? 'program length',
                  ),
                  cardBuilder(
                      title: 'Program vocabulary size:',
                      value: halsProvider.programVocabulary ??
                          'Program vocabulary size'),
                  cardBuilder(
                      title: 'Program volume:',
                      value: halsProvider.programVolume ?? 'Program volume'),
                  cardBuilder(
                      title: 'Program difficulty / error proneness:',
                      value: halsProvider.programDiifficulty ??
                          'Program difficulty / error proneness'),
                  cardBuilder(
                      title: 'Program level:',
                      value: halsProvider.programLevel ?? 'Program level'),
                  cardBuilder(
                      title: 'Program effort:',
                      value: halsProvider.programEffort ?? 'Program effort'),
                  cardBuilder(
                      title: 'Programming time:',
                      value:
                          halsProvider.programmingTime ?? 'Programming time'),
                  cardBuilder(
                      title: 'Program bugs:',
                      value: halsProvider.programmingBugs ?? 'Program bugs'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cardBuilder({required String title, required var value}) {
    if (value.runtimeType == String) {}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SizedBox(
            height: 40,
            // width: 450,
            child: Card(
              shape: OutlineInputBorder(
                // borderSide: BorderSide(color: Color(0xFF30009c),),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              color: Colors.white70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    value.toString(),
                    style: value.runtimeType == String
                        ? TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          )
                        : TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 8))
      ],
    );
  }

  // Future outPutCalculator(HalsteadCalcProvider halsProvider) async {
  //   double? n1 = halsProvider.n1;
  //   double? N1 = halsProvider.N1;
  //   double? n2 = halsProvider.n2;
  //   double N2 = halsProvider.N2!;
  //   setState(() {
  //     programLength = n1! + n2!;
  //   });
  // }
}
