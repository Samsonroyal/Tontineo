import 'package:flutter/material.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/presentation/onboarding_four_screen/models/onboarding_four_model.dart';

/// A provider class for the OnboardingFourScreen.
///
/// This provider manages the state of the OnboardingFourScreen, including the
/// current onboardingFourModelObj
class OnboardingFourProvider extends ChangeNotifier {
  OnboardingFourModel onboardingFourModelObj = OnboardingFourModel();

  @override
  void dispose() {
    super.dispose();
  }
}
