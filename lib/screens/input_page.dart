import 'dart:async';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'result_page.dart';
import '../components/roundRectangleButton.dart';
import '../components/roundIconButton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Timer _timer;
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild:
                      IconContent(icons: FontAwesomeIcons.mars, text: 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icons: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        //activeColor: Colors.white,
                        inactiveColor: Color(0xFF8D8E98),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                },
                              );
                            },
                            onTapDown: (TapDownDetails details) {
                              print('down');
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (t) {
                                setState(() {
                                  if (weight > 10) weight--;
                                });
                                print('value $weight');
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              print('up');
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              print('cancel');
                              _timer.cancel();
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              print('down');
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (t) {
                                setState(() {
                                  weight++;
                                });
                                print('value $weight');
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              print('up');
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              print('cancel');
                              _timer.cancel();
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kTextStyle),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (age > 5) {
                                    age--;
                                  }
                                },
                              );
                            },
                            onTapDown: (TapDownDetails details) {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (timer) {
                                setState(() {
                                  if (age > 5) {
                                    age--;
                                  }
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              _timer.cancel();
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (age > 5) {
                                      age--;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: 100), (timer) {
                                setState(() {
                                  age++;
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              _timer.cancel();
                            },
                            onTapCancel: () {
                              _timer.cancel();
                            },
                            child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          RoundRectangleButton(
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
              text: 'CALCULATE'),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
