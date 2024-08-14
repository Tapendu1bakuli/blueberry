
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/TextStyles.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.isLoading.value = false;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //     height: ScreenConstant.defaultHeightNinety,
            //     width: ScreenConstant.defaultWidthEighty,
            //     child: Lottie.asset(AnimationUtilis.splashAnimation)),
            Text(
              AppStrings.welcome,
              style: context.textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
