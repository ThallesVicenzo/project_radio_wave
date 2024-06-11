import 'package:design_system/widgets/image/network_image_widget.dart';
import 'package:design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.radioName,
    required this.url,
  });

  final String radioName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkImageWidget(
            url: url,
            fit: BoxFit.cover,
            size: const Size(125, 125),
          ),
          const SizedBox(height: 4),
          const SizedBox(
            width: 130,
            child: AppText(
              'Andrey gay kk mds',
              fontSize: FontSize.small,
            ),
          )
        ],
      ),
    );
  }
}
