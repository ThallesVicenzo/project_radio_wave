import 'package:design_system/enums/app_images.dart';
import 'package:design_system/utils/values/finals.dart';
import 'package:design_system/widgets/app_bar/default_app_bar.dart';
import 'package:design_system/widgets/buttons/default_button.dart';
import 'package:design_system/widgets/colors/radiowave_colors.dart';
import 'package:design_system/widgets/custom_padding/custom_padding_page.dart';
import 'package:design_system/widgets/image/asset_image_widget.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_wave/app_injector.dart';
import 'package:radio_wave/l10n/global_app_localizations.dart';

import '../cubit/onboarding_cubit.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final intl = sl<GlobalAppLocalizations>().current;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (_) => OnboardingCubit(sl()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: DefaultAppBar(
          title: intl.onboardingPageTitle,
          color: Colors.transparent,
          hasLeading: true,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: deviceSize.height,
                width: deviceSize.width,
                child: const AssetImageWidget(
                  image: AppImage.backgroundImage2,
                  fit: BoxFit.cover,
                ),
              ),
              CustomPaddingPage(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: deviceSize.height * 0.3),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          height: deviceSize.height * 0.4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: RadioWaveColors.lightBlue,
                            boxShadow: boxShadowStyle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Form(
                                    child: AppTextFormField(
                                      hintText: 'Email...',
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Form(
                                    child: AppTextFormField(
                                      hintText: intl.passwordField,
                                    ),
                                  ),
                                ],
                              ),
                              DefaultButton(
                                title: intl.onboardingButtonTitle,
                                size: const Size(double.infinity, 48),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
