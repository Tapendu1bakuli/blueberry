
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/TextStyles.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/widgets/universal_button_widget.dart';
import '../../../../database/db_helper.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../utils/common_text_form_field.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../controller/home_controller.dart';

class AddNewBookScreen extends GetView<HomeController> {
  const AddNewBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add New Book",
          style: TextStyles.subtitleSmall.copyWith(
              color: CustomColor.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
        child: ListView(
          children: [
            Text(
              "Title",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: controller.titleController,
              hintText: AppStrings.enterDescription.tr,
            ),

            Text(
              "Handle",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: controller.handleController,
              hintText: AppStrings.enterDescription.tr,
            ),
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Text(
              "Year",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: controller.yearController,
              hintText: AppStrings.enterDescription.tr,
            ),

            Text(
              "Pages",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: controller.pagesController,
              hintText: AppStrings.enterDescription.tr,
            ),

            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Text(
              "Publisher",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: controller.publisherController,
              hintText: AppStrings.enterPublisher.tr,
            ),
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Text(
              "ISBN",
              style: TextStyles.subtitleSmall.copyWith(
                  color: CustomColor.primaryDeepblue.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: ScreenConstant.defaultHeightFour,
            ),
            DefaultEditText(
              type: Type.stageName,
              prefixIcon: Container(),
              style: TextStyles.textFieldTextStyleSemiBold,
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: controller.isbnController,
              hintText: AppStrings.enterISBN.tr,
            ),

            Container(
              height: ScreenConstant.defaultHeightTwentyThree,
            ),
            UniversalButtonWidget(
              ontap: () async {
              await SQLHelper().insertBook(int.parse(controller.yearController.text),controller.titleController.text,controller.handleController.text,controller.publisherController.text,controller.isbnController.text,int.parse(controller.pagesController.text));
              Get.back();
              controller.booksListFetch();
              },
              color: CustomColor.orange,
              margin: EdgeInsets.symmetric(
                vertical: ScreenConstant.defaultHeightFifteen,
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              leadingIconvisible: true,
              title: AppStrings.save.tr,
              titleTextStyle:
              TextStyles.textStyleRegular.apply(color: CustomColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
