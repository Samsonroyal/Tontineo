import 'models/onboarding_three_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/widgets/custom_elevated_button.dart';
import 'provider/onboarding_three_provider.dart';

class OnboardingThreeScreen extends StatefulWidget {
  const OnboardingThreeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingThreeScreenState createState() => OnboardingThreeScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingThreeProvider(),
      child: OnboardingThreeScreen(),
    );
  }
}

class OnboardingThreeScreenState extends State<OnboardingThreeScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 26.v),
              CustomImageView(
                imagePath: ImageConstant.imgGroup7345,
                height: 284.v,
                width: 231.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 4.h),
              ),
              SizedBox(height: 27.v),
              SizedBox(
                height: 8.v,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 3,
                  effect: ScrollingDotsEffect(
                    spacing: 8,
                    activeDotColor: appTheme.blueGray900,
                    dotColor: theme.colorScheme.onPrimaryContainer,
                    dotHeight: 8.v,
                    dotWidth: 8.h,
                  ),
                ),
              ),
              SizedBox(height: 59.v),
              Text(
                "msg_secured_contributions".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 11.v),
              SizedBox(
                width: 224.h,
                child: Text(
                  "msg_safeguard_your_money".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.43,
                  ),
                ),
              ),
              SizedBox(height: 79.v),
              CustomElevatedButton(
                text: "lbl_next".tr.toUpperCase(),
              ),
              SizedBox(height: 53.v),
              Text(
                "lbl_skip".tr.toUpperCase(),
                style: CustomTextStyles.labelLargePrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
