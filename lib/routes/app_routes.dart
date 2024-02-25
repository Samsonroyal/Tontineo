import 'package:flutter/material.dart';
import 'package:were_s_application7/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:were_s_application7/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:were_s_application7/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:were_s_application7/presentation/onboarding_four_screen/onboarding_four_screen.dart';
import 'package:were_s_application7/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingFourScreen = '/onboarding_four_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingThreeScreen: OnboardingThreeScreen.builder,
        onboardingOneScreen: OnboardingOneScreen.builder,
        onboardingTwoScreen: OnboardingTwoScreen.builder,
        onboardingFourScreen: OnboardingFourScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OnboardingOneScreen.builder
      };
}
