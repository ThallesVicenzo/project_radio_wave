import 'package:design_system/utils/values/finals.dart';
import 'package:design_system/widgets/colors/radiowave_colors.dart';
import 'package:design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.height = 65,
    required this.title,
    required this.hasLeading,
    this.leading,
    this.color,
  });

  final double height;
  final String title;
  final bool hasLeading;
  final void Function()? leading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? RadioWaveColors.backgroundColor,
      automaticallyImplyLeading: hasLeading,
      leading: Visibility(
        visible: hasLeading,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            shadows: shadowStyle,
            color: Colors.white,
          ),
          onPressed: leading ??
              () {
                Navigator.pop(context);
              },
        ),
      ),
      centerTitle: true,
      title: AppText(
        title,
        fontSize: FontSize.small,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
