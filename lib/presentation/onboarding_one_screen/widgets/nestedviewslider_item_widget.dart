import '../models/nestedviewslider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:were_s_application7/core/app_export.dart';

// ignore: must_be_immutable
class NestedviewsliderItemWidget extends StatelessWidget {
  NestedviewsliderItemWidget(
    this.nestedviewsliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NestedviewsliderItemModel nestedviewsliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 76.h,
          vertical: 75.v,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: fs.Svg(
              ImageConstant.imgGroup3,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22.h),
              child: Text(
                "lbl_ngn".tr,
                style: CustomTextStyles.interBlack900,
              ),
            ),
            SizedBox(height: 12.v),
            Row(
              children: [
                Text(
                  "lbl_ngn".tr,
                  style: CustomTextStyles.interBlack900Medium,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "lbl_ngn".tr,
                    style: CustomTextStyles.interBlack900Medium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 73.v),
          ],
        ),
      ),
    );
  }
}
