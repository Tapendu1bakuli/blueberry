import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/universal_button_widget.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../utils/Store/HiveStore.dart';
import '../../../../utils/TextStyles.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/image_utils/image_utils.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../controller/home_controller.dart';

class DrawerDataScreen extends GetView<HomeController> {
  const DrawerDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 48, 0, 12),
      child: Container(
        color: Get.theme.focusColor,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenConstant.defaultHeightTwentyThree,
                  bottom: ScreenConstant.defaultHeightTwentyThree,
                  left: ScreenConstant.defaultWidthTwenty),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: CachedNetworkImage(
                      height: ScreenConstant.screenHeightTwelve,
                      width: ScreenConstant.screenWidthSixth,
                      fit: BoxFit.fill,
                      imageUrl: "https://www.blueberryeservices.com/wp-content/uploads/2021/02/Logo.jpg",
                      placeholder: (context, url) => Image.asset(
                        ImageUtils.loadingImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    ),
                  ),
                  Container(
                    width: ScreenConstant.defaultWidthTen,
                  ),
                  Text(
                    AppStrings.welcome,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.drawerSubTitleBold,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              child: Container(
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTwenty,
                      vertical: ScreenConstant.defaultHeightTen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.toggleBetweenTheme.tr,
                        style: Get.textTheme.titleLarge?.merge(
                            TextStyle(color: context.theme.primaryColor)),
                      ),
                      Container(height: ScreenConstant.defaultHeightFifteen,),
                      Row(
                        children: [
                          Icon(
                            HiveStore().getBool(Keys.ISDARK)
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: CustomColor.primaryBlue,
                          ),
                          Container(
                            width: ScreenConstant.defaultWidthTwenty,
                          ),
                          CupertinoSwitch(activeColor: CustomColor.dividerColor,
                            thumbColor: CustomColor.primaryBlue,
                            trackColor: CustomColor.secondaryBlue,
                            value: HiveStore().getBool(Keys.ISDARK),
                            onChanged: (value) {
                              controller.toggleValue.value = value;
                              HiveStore().setBool(Keys.ISDARK, value);
                              if (controller.toggleValue.value) {
                                Get.changeThemeMode(ThemeMode.dark);
                              } else {
                                Get.changeThemeMode(ThemeMode.light);
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.screenHeightHalf,
                  horizontal: ScreenConstant.defaultWidthTwenty),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: UniversalButtonWidget(
                      borderColor: CustomColor.white,
                      borderRadius: BorderRadius.circular(15),
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTen,
                          vertical: ScreenConstant.defaultHeightTwentyThree),
                      ontap: () {
                        SystemNavigator.pop();
                      },
                      leadingIconvisible: true,
                      title: AppStrings.logout.tr,
                      titleTextStyle: TextStyles.textStyleRegular
                          .apply(color: CustomColor.primaryBlue),
                      color: CustomColor.white,
                    ),
                  ),
                  Expanded(flex: 3, child: Container())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
