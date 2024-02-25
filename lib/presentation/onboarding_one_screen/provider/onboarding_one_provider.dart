import 'package:flutter/material.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/presentation/onboarding_one_screen/models/onboarding_one_model.dart';
import '../models/nestedviewslider_item_model.dart';

/// A provider class for the OnboardingOneScreen.
///
/// This provider manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj

// ignore_for_file: must_be_immutable
class OnboardingOneProvider extends ChangeNotifier {
  OnboardingOneModel onboardingOneModelObj = OnboardingOneModel();

  int sliderIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }
}
