import 'package:flutter/material.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/presentation/onboarding_two_screen/models/onboarding_two_model.dart';

/// A provider class for the OnboardingTwoScreen.
///
/// This provider manages the state of the OnboardingTwoScreen, including the
/// current onboardingTwoModelObj
class OnboardingTwoProvider extends ChangeNotifier {
  OnboardingTwoModel onboardingTwoModelObj = OnboardingTwoModel();

  @override
  void dispose() {
    super.dispose();
  }
}
