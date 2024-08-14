
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/TextStyles.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/widgets/universal_button_widget.dart';
import '../../../../database/db_helper.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../utils/common_text_form_field.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../../../../utils/utils.dart';
import '../controller/home_controller.dart';

class BookDescription extends GetView<HomeController> {
  BookDescription({super.key});

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments[0],
          style: TextStyles.subtitleSmall.copyWith(
              color: CustomColor.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
        child: ListView(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.defaultWidthTwenty,
                    vertical: ScreenConstant.defaultHeightTen),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CustomColor.containerColor7.withOpacity(0.1)),
                child: Text(
                  "Year: ${arguments[1]}",
                  style: TextStyles.subtitleSmall.copyWith(
                      color: CustomColor.primaryDeepblue.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.defaultWidthTwenty,
                        vertical: ScreenConstant.defaultHeightTen),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CustomColor.containerColor6.withOpacity(0.1)),
                    child: Text(
                      "Handle: ${arguments[2]}",
                      style: TextStyles.subtitleSmall.copyWith(
                          color: CustomColor.primaryDeepblue.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTwenty,
                      vertical: ScreenConstant.defaultHeightTen),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CustomColor.containerColor5.withOpacity(0.1)),
                  child: Text(
                    "Publishar: ${arguments[3]}",
                    style: TextStyles.subtitleSmall.copyWith(
                        color: CustomColor.primaryDeepblue.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.defaultWidthTwenty,
                        vertical: ScreenConstant.defaultHeightTen),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CustomColor.containerColor6.withOpacity(0.1)),
                    child: Text(
                      "ISBN: ${arguments[4]}",
                      style: TextStyles.subtitleSmall.copyWith(
                          color: CustomColor.primaryDeepblue.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTwenty,
                      vertical: ScreenConstant.defaultHeightTen),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CustomColor.containerColor5.withOpacity(0.1)),
                  child: Text(
                    "Pages: ${arguments[5]}",
                    style: TextStyles.subtitleSmall.copyWith(
                        color: CustomColor.primaryDeepblue.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Container(
              height: ScreenConstant.defaultHeightTen,
            ),
            Center(
              child: Text("Edit Details:"),
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
                print(arguments[6]);
                if(controller.handleController.text == "" && controller.isbnController.text == "" && controller.publisherController.text == "" && controller.pagesController.text == ""){
                  showFailureSnackBar("Error", "Nothing ti update");
                }else{
                  await SQLHelper().updateBook(
                   id: arguments[6],title: arguments[0],handle: controller.handleController.text.isNotEmpty
                      ? controller.handleController.text
                      : arguments[2],isbn: controller.isbnController.text.isNotEmpty
                      ? controller.isbnController.text
                      : arguments[4],publisher: controller.publisherController.text.isNotEmpty
                        ? controller.publisherController.text
                        : arguments[3],
                  );
                  Get.back();
                  controller
                      .refreshBooksList();

                }

              },
              color: CustomColor.orange,
              margin: EdgeInsets.symmetric(
                vertical: ScreenConstant.defaultHeightFifteen,
                horizontal: ScreenConstant.defaultWidthTwenty,
              ),
              leadingIconvisible: true,
              title: AppStrings.update.tr,
              titleTextStyle:
                  TextStyles.textStyleRegular.apply(color: CustomColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
