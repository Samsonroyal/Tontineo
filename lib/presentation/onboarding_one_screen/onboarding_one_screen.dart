import '../onboarding_one_screen/widgets/nestedviewslider_item_widget.dart';
import 'models/nestedviewslider_item_model.dart';
import 'models/onboarding_one_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:were_s_application7/core/app_export.dart';
import 'package:were_s_application7/widgets/custom_elevated_button.dart';
import 'provider/onboarding_one_provider.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingOneScreenState createState() => OnboardingOneScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingOneProvider(),
      child: OnboardingOneScreen(),
    );
  }
}

class OnboardingOneScreenState extends State<OnboardingOneScreen> {
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
              SizedBox(height: 60.v),
              _buildNestedViewSlider(context),
              SizedBox(height: 27.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Consumer<OnboardingOneProvider>(
                  builder: (context, provider, child) {
                    return Container(
                      height: 8.v,
                      margin: EdgeInsets.only(left: 123.h),
                      child: AnimatedSmoothIndicator(
                        activeIndex: provider.sliderIndex,
                        count: provider.onboardingOneModelObj
                            .nestedviewsliderItemList.length,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          spacing: 8,
                          activeDotColor: appTheme.blueGray900,
                          dotColor: theme.colorScheme.onPrimaryContainer,
                          dotHeight: 8.v,
                          dotWidth: 8.h,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 61.v),
              Text(
                "msg_track_your_contributions".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 9.v),
              SizedBox(
                width: 200.h,
                child: Text(
                  "msg_keep_track_of_all".tr,
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
              SizedBox(height: 50.v),
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

  /// Section Widget
  Widget _buildNestedViewSlider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40.h,
        right: 55.h,
      ),
      child: Consumer<OnboardingOneProvider>(
        builder: (context, provider, child) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: 247.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (
                index,
                reason,
              ) {
                provider.sliderIndex = index;
              },
            ),
            itemCount:
                provider.onboardingOneModelObj.nestedviewsliderItemList.length,
            itemBuilder: (context, index, realIndex) {
              NestedviewsliderItemModel model = provider
                  .onboardingOneModelObj.nestedviewsliderItemList[index];
              return NestedviewsliderItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
