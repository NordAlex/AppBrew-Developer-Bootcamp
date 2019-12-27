import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/component_card.dart';
import 'package:bmi_calculator/components/component_icon.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  var height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ComponentCard(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        backgroundColor: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: CardIcon(
                          text: 'MALE',
                          iconData: FontAwesomeIcons.mars,
                        ))),
                Expanded(
                  child: ComponentCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      backgroundColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: CardIcon(
                        text: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            )),
            Expanded(
              child: ComponentCard(
                  backgroundColor: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30),
                              thumbColor: const Color(0xFFEB1555),
                              overlayColor: const Color(0x29EB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: const Color(0xFF8D8E98)),
                          child: Slider(
                            value: height.toDouble(),
                            max: 220,
                            min: 120,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ))
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ComponentCard(
                        backgroundColor: kActiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(weight.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: ComponentCard(
                  backgroundColor: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              onTap: () {
                final bmiCalculator = BmiModel(weight: weight, height: height);
                Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResults: bmiCalculator.calculateBMI(),
                              resultText: bmiCalculator.getResults(),
                              interpretation: bmiCalculator.getInterpretation(),
                            )));
              },
              text: 'CALCULATE',
            )
          ],
        )));
  }
}
