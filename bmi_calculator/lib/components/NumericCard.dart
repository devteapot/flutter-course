import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

class NumericCard extends StatelessWidget {
  const NumericCard({
    Key? key,
    required this.value,
    required this.label,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  final int value;
  final String label;
  final void Function() onIncrease;
  final void Function() onDecrease;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                onPressed: onDecrease,
                icon: FontAwesomeIcons.minus,
              ),
              const SizedBox(width: 10.0),
              RoundIconButton(
                onPressed: onIncrease,
                icon: FontAwesomeIcons.plus,
              ),
            ],
          )
        ],
      ),
    );
  }
}
