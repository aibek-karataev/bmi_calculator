import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCUTOR',
      home: const HomePage(),
    );
  }
}

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? gender = Gender.male;
  int height = 120;
  int weight = 20;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: kBG,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: kBG,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReUsableCard(
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      color: gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male,
                            size: 80,
                          ),
                          Text(
                            "MALE",
                            style: kBodyTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      onTap: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      color: gender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female,
                            size: 80,
                          ),
                          Text(
                            "FEMALE",
                            style: kBodyTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReUsableCard(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "HEIGHT",
                      style: kBodyTextStyle,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5.0),
                          child: Text(
                            "cm",
                            style: TextStyle(fontSize: 22.0),
                          ),
                        )
                      ],
                    ),
                    Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        mouseCursor: MouseCursor.uncontrolled,
                        thumbColor: kBottomContainerColor,
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (val) {
                          setState(() {
                            height = val.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            //
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReUsableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kBodyTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AbsorbPointer(
                                absorbing: weight <= 20,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (weight > 20) {
                                        weight--;
                                      }
                                    });
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: weight > 20
                                          ? const Color(0xff5C5B5B)
                                          : const Color(0xff5C5B5B)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                              AbsorbPointer(
                                absorbing: weight >= 150,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: weight < 150
                                          ? const Color(0xff5C5B5B)
                                          : const Color(0xff5C5B5B)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kBodyTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AbsorbPointer(
                                absorbing: age <= 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (age > 15) {
                                        age--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: age > 15
                                          ? const Color(0xff5C5B5B)
                                          : const Color(0xff5C5B5B)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                              AbsorbPointer(
                                absorbing: age > 130,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (age < 130) {
                                        age++;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: age < 130
                                          ? const Color(0xff5C5B5B)
                                          : const Color(0xff5C5B5B)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
                top: 5.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    final hSquare = height / 100;
                    final result = weight / (hSquare * hSquare);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: result,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBottomContainerColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Calculate",
                    style: kBodyTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReUsableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function? onTap;

  const ReUsableCard({
    super.key,
    this.color = kInactiveCardColor,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (onTap != null) {onTap!()}
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: child,
      ),
    );
  }
}
