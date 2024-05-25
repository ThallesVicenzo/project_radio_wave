import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_wave/core/presenter/routes/main_routes.dart';

import '../../../features/welcome/presenter/pages/onboarding_page.dart';
import '../../../features/welcome/presenter/pages/welcome_page.dart';
import '../../../features/welcome/welcome_routes.dart';
import '../widgets/animations/transition_factory.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

final router = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: MainRoutes.welcome.route,
  observers: [],
  routes: [
    GoRoute(
      path: MainRoutes.welcome.route,
      name: MainRoutes.welcome.route,
      pageBuilder: (context, state) => MaterialPage(
        child: const WelcomePage(),
        name: state.name,
      ),
      routes: [
        GoRoute(
          path: WelcomeRoutes.onboardingPage.route,
          name: WelcomeRoutes.onboardingPage.route,
          pageBuilder: (context, state) =>
              TransitionFactory.getSlidePageBuilder(
            child: const OnBoardingPage(),
          ),
        ),
      ],
    ),
  ],
);
