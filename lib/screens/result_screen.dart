import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  const ResultPage({super.key, required this.bmi});

  /*
    Severe Thinness	< 16
    Moderate Thinness	16 - 17
    Mild Thinness	17 - 18.5
    Normal	18.5 - 25
    Overweight	25 - 30
    Obese Class I	30 - 35
    Obese Class II	35 - 40
    Obese Class III	> 40
  */

  checkBMI(bmi) {
    if (bmi < 16) {
      return const Text(
        "Severe Thinness",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (bmi >= 16 && bmi < 17) {
      return const Text(
        "Moderate Thinness",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (bmi >= 17 && bmi <= 18.5) {
      return const Text(
        "Mild Thinness",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (bmi > 18.5 && bmi <= 25) {
      return const Text(
        "Normal",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (bmi > 25 && bmi <= 30) {
      return const Text(
        "Overweight",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return const Text(
        "Obesity",
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveCardColor,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: kBG,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "Your BMI result",
                    style: kLargeButtonTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50.0,
                  ),
                  decoration: BoxDecoration(
                    color: kBG,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        checkBMI(bmi),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          bmi.toStringAsFixed(2),
                          style: kNumberTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                    color: kBottomContainerColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Center(
                  child: Text(
                    "Back to Home",
                    style: kBodyTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
