import 'models/onboarding_two_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/widgets/custom_elevated_button.dart';
import 'provider/onboarding_two_provider.dart';

class OnboardingTwoScreen extends StatefulWidget {
  const OnboardingTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingTwoScreenState createState() => OnboardingTwoScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingTwoProvider(),
      child: OnboardingTwoScreen(),
    );
  }
}

class OnboardingTwoScreenState extends State<OnboardingTwoScreen> {
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
              SizedBox(height: 29.v),
              CustomImageView(
                imagePath: ImageConstant.imgPaidIdeaAmico,
                height: 280.v,
                width: 287.h,
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
              SizedBox(height: 61.v),
              Text(
                "msg_save_to_reach_your".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 9.v),
              Container(
                width: 304.h,
                margin: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  "msg_achieve_the_goals".tr,
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
