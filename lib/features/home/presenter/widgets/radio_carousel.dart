import 'package:design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

import 'radio_widget.dart';

class RadioCarousel extends StatelessWidget {
  const RadioCarousel({
    super.key,
    required this.title,
    required this.radioName,
    required this.radioImage,
  });

  final String title;
  final String radioName;
  final String radioImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          fontSize: FontSize.mediumSmall,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => RadioWidget(
              radioName: radioName,
              url: radioImage,
            ),
          ),
        ),
      ],
    );
  }
}
