import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../utils/TextStyles.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_utils/app_strings.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget(
      {super.key,
      this.image,
      this.title,
      this.description,
      this.onTapEdit,
      this.onTapDelete});

  String? image;
  String? title;
  String? description;
  Function()? onTapEdit;
  Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColor.alertDialogButton,
            CustomColor.white,
            CustomColor.dividerColor
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: ScreenConstant.defaultWidthTen,
          vertical: ScreenConstant.defaultHeightFifteen),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.defaultWidthTen,
            vertical: ScreenConstant.defaultHeightFifteen),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: ScreenConstant.defaultHeightNinety,
                  child: Image.file(
                    fit: BoxFit.fitWidth,
                    File(image ?? ""),
                  ),
                ),
              ),
            ),
            Container(
              width: ScreenConstant.defaultWidthTen,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      children: [
                        TextSpan(
                          text:  AppStrings.title.tr,
                          style: TextStyles.homeTabStyleSemiBold.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700,color: CustomColor.primaryBlue),
                        ),
                        TextSpan(text:title ?? "",style: TextStyles.homeTabStyleSemiBold.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      children: [
                        TextSpan(
                          text:  AppStrings.description.tr,
                          style: TextStyles.homeTabStyleSemiBold.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700,color: CustomColor.primaryBlue),
                        ),
                        TextSpan(text:description ?? "",style: TextStyles.homeTabStyleSemiBold.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: onTapEdit,
                child: const Icon(
                  Icons.edit,
                  color: CustomColor.primaryBlue,
                )),
            Container(
              width: ScreenConstant.defaultWidthTen,
            ),
            InkWell(
                onTap: onTapDelete,
                child: const Icon(
                  Icons.delete,
                  color: CustomColor.orange,
                ))
          ],
        ),
      ),
    );
  }
}
