import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component_card.dart';
import 'component_icon.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomMenuColor = Colors.red;
const bottomMenuHeight = 80.0;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateSelectedGender(Gender gender) {
    if (gender == Gender.male) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
      return;
    }
    maleCardColor = inactiveCardColor;
    femaleCardColor = activeCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateSelectedGender(Gender.male);
                          });
                        },
                        child: ComponentCard(
                            backgroundColor: maleCardColor,
                            child: CardIcon(
                              text: 'MALE',
                              iconData: FontAwesomeIcons.mars,
                            )))),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateSelectedGender(Gender.female);
                        });
                      },
                                          child: ComponentCard(
                          backgroundColor: femaleCardColor,
                          child: CardIcon(
                            text: 'FEMALE',
                            iconData: FontAwesomeIcons.venus,
                          )),
                    )),
              ],
            )),
            Expanded(
              child: new ComponentCard(
                backgroundColor: activeCardColor,
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ComponentCard(
                  backgroundColor: activeCardColor,
                )),
                Expanded(
                    child: ComponentCard(
                  backgroundColor: activeCardColor,
                )),
              ],
            )),
            Container(
              width: double.infinity,
              height: bottomMenuHeight,
              color: bottomMenuColor,
            )
          ],
        )));
  }
}
