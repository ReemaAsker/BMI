import 'package:flutter/material.dart';

import '../Widgets/my_card.dart';
import '../logic/BMI_class.dart';
import 'ResultPage.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMale = true;
  int height = 166;
  int weight = 60;
  int age = 22;
  double currentvalue = 20;

  @override
  Widget build(BuildContext context) {
    // currentvalue = height.toDouble();

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Male")
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: isMale ? Colors.blue : Colors.grey,
                    ),
                  ),
                )),
                Expanded(
                    child: MyCard(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Female")
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: (!isMale) ? Colors.pink : Colors.grey),
                  ),
                )),
              ],
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            currentvalue.round().toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 54),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Slider(
                          value: currentvalue,
                          max: 200,
                          label: currentvalue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              currentvalue = value;
                            });
                          }),
                    ],
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT"),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                print(weight);

                                setState(() {
                                  weight < 200 ? weight++ : 200;
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              backgroundColor: Colors.grey[100],
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight >= 1 ? weight-- : 0;
                                });
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              backgroundColor: Colors.grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age"),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age < 100 ? age++ : 100;
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              backgroundColor: Colors.grey[100],
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age >= 1 ? age-- : 1;
                                });
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              backgroundColor: Colors.grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Bmi my_bmi = Bmi(height: height, weight: weight);
                // print(
                // 'male = $isMale height = $height weight = $widget age =$age');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      current_bmi: my_bmi,
                    ),
                  ),
                );
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
