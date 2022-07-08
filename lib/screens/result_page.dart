import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/roundRectangleButton.dart';
import '../components/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text('YOUR RESULT', style: kTitleTextStyle),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      resultText,
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmiResult,
                      style: kResultNumberStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      interpretation,
                      style: kMessageTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          RoundRectangleButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE'),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
