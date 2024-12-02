import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animated_progress_indicator.dart';
import 'package:marquee/marquee.dart';

import '../../../constants.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.70,
                label: Text("Flutter"),
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.70,
                label: Marquee(
                  text: 'Digital Marketing',
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0, // Adjust the speed as needed
                  pauseAfterRound: Duration(seconds: 1), // Adjust pause duration
                  startPadding: 10.0, // Adjust start padding
                  accelerationDuration: Duration(seconds: 1), // Adjust acceleration
                  accelerationCurve: Curves.linear, // Adjust acceleration curve
                  decelerationDuration: Duration(milliseconds: 500), // Adjust deceleration
                  decelerationCurve: Curves.easeOut, // Adjust deceleration curve
                ),
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.90,
                label: Marquee(
                  text: 'Web Builder',
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0, // Adjust the speed as needed
                  pauseAfterRound: Duration(seconds: 1), // Adjust pause duration
                  startPadding: 10.0, // Adjust start padding
                  accelerationDuration: Duration(seconds: 1), // Adjust acceleration
                  accelerationCurve: Curves.linear, // Adjust acceleration curve
                  decelerationDuration: Duration(milliseconds: 500), // Adjust deceleration
                  decelerationCurve: Curves.easeOut, // Adjust deceleration curve
                ),
              ),
            ),
          ],

        ),

      ],
    );
  }
}
class AnimatedCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final Widget label;

  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[200],
              color: Colors.orange,
              strokeWidth: 5.0,
            ),
            Text(
              "${(percentage * 100).toInt()}%", // النسبة المئوية
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 20,
          child: Center(child: label),
        ),
      ],
    );
  }
}
