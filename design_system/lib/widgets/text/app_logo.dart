import 'package:design_system/enums/app_images.dart';
import 'package:design_system/widgets/image/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.oswald(color: Colors.white, fontSize: 32),
        ),
        const AssetImageWidget(
          image: AppImage.logo,
          size: Size(180, 180),
        )
      ],
    );
  }
}
