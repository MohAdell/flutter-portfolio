import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animates_counter.dart';
import 'package:flutter_profile/responsive.dart';

import '../../constants.dart';
import 'components/high_light.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HighLight(
                      counter: AnimatedCounter(
                        value: 10,
                        text: "+",
                      ),
                      label: "Projects",
                    ),
                    HighLight(
                      counter: AnimatedCounter(
                        value: 10,
                        text: "+",
                      ),
                      label: "Github Repos",
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HighLight(
                      counter: AnimatedCounter(
                        value: 40,
                        text: "K+",
                      ),
                      label: "Social Followers",
                    ),
                    
                  ],
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HighLight(
                  counter: AnimatedCounter(
                    value: 10,
                    text: "+",
                  ),
                  label: "Projects",
                ),
                HighLight(
                  counter: AnimatedCounter(
                    value: 10,
                    text: "+",
                  ),
                  label: "Github Repos",
                ),
                HighLight(
                  counter: AnimatedCounter(
                    value: 40,
                    text: "K+",
                  ),
                  label: "Social Followers",
                ),
              ],
            ),
    );
  }
}
