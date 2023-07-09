import 'package:flutter/material.dart';

import '../logic/BMI_class.dart';

class ResultsPage extends StatelessWidget {
  final Bmi current_bmi;

  const ResultsPage({super.key, required this.current_bmi});

  @override
  Widget build(BuildContext context) {
    int get_bmi_result() {
      return current_bmi.calculateBMI();
    }

    String get_bmi_description() {
      return current_bmi.getDescription();
    }

    String get_bmi_pointer() {
      return current_bmi.getResult();
    }

    int bmiResult = get_bmi_result();
    String? resultText = get_bmi_pointer();
    String? desc = get_bmi_description();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Card(
              // colour: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                        color: resultText == 'Normal'
                            ? Colors.greenAccent
                            : Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult.toString(),
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                  Text(desc),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "RE-Calculate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
