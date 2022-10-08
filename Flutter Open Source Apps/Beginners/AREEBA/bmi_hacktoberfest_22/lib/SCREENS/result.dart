import 'package:flutter/material.dart';
import '../Components/bottom_button.dart';
import '../constants.dart';
import '../Components/reuseable_card.dart';

class Resultspage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const Resultspage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: const Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: ReuseableCard(
                colour: kInactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                onPress: () {},
              )),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
