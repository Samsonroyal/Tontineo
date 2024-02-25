import 'models/onboarding_four_model.dart';
import 'package:flutter/material.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/widgets/custom_elevated_button.dart';
import 'package:were_s_application7/widgets/custom_outlined_button.dart';
import 'provider/onboarding_four_provider.dart';

class OnboardingFourScreen extends StatefulWidget {
  const OnboardingFourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingFourScreenState createState() => OnboardingFourScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingFourProvider(),
      child: OnboardingFourScreen(),
    );
  }
}

class OnboardingFourScreenState extends State<OnboardingFourScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 50.v,
          ),
          child: Column(
            children: [
              Spacer(
                flex: 27,
              ),
              Container(
                width: 254.h,
                margin: EdgeInsets.symmetric(horizontal: 43.h),
                child: Text(
                  "msg_get_started_with".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.43,
                  ),
                ),
              ),
              SizedBox(height: 56.v),
              CustomElevatedButton(
                text: "msg_continue_with_email".tr.toUpperCase(),
                margin: EdgeInsets.only(right: 6.h),
              ),
              SizedBox(height: 24.v),
              CustomOutlinedButton(
                text: "msg_continue_with_google".tr.toUpperCase(),
                margin: EdgeInsets.only(right: 6.h),
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 13.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      6.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgRectangle418,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
              ),
              Spacer(
                flex: 33,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_already_have_an2".tr,
                      style: CustomTextStyles.bodyMediumff666666,
                    ),
                    TextSpan(
                      text: "lbl".tr,
                      style: CustomTextStyles.bodyMediumff666666,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "lbl_sign_in".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Spacer(
                flex: 38,
              ),
              Container(
                width: 279.h,
                margin: EdgeInsets.only(
                  left: 31.h,
                  right: 30.h,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_by_signing_up_you2".tr,
                        style: CustomTextStyles.labelLargeff999999,
                      ),
                      TextSpan(
                        text: "lbl_privacy_policy".tr,
                        style: CustomTextStyles.labelLargeff0d2543,
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "lbl_and".tr,
                        style: CustomTextStyles.labelLargeff999999,
                      ),
                      TextSpan(
                        text: "msg_terms_and_conditions".tr,
                        style: CustomTextStyles.labelLargeff0d2543,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
