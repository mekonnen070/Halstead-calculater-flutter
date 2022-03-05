import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:halstead_calculator_for_metrics_group_work/HalsteadCalcProvider.dart';
import 'package:halstead_calculator_for_metrics_group_work/InputPage.dart';
import 'package:halstead_calculator_for_metrics_group_work/OutputPage.dart';
import 'package:halstead_calculator_for_metrics_group_work/chooseCalculatorType.dart';
// import 'package:halstead_calculator_for_metrics_group_work/dynamicProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static const title = 'Halstead Calculator';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HalsteadCalcProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: ChooseCalculatorType(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HalsteadCalcProvider>(builder: (context, halsProvider, _) {
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
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Wrap(
            children: [
              const InputScreen(),
              if (halsProvider.isvalidated == true)
                const OutputScreen()
              else
                const SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
