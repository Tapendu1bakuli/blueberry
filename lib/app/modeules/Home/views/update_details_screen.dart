// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../common/widgets/universal_button_widget.dart';
// import '../../../../device_manager/screen_constants.dart';
// import '../../../../utils/TextStyles.dart';
// import '../../../../utils/colors/app_colors.dart';
// import '../../../../utils/common_text_form_field.dart';
// import '../../../../utils/text_utils/app_strings.dart';
// import '../../../../utils/utils.dart';
//
// class UpdateDetailsScreen extends GetView<HomeController> {
//   const UpdateDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var data = Get.arguments;
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         appBar: AppBar(
//           scrolledUnderElevation: 0.0,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: CustomColor.white,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//           title: Text(
//             AppStrings.updateDetails.tr,
//             style: TextStyles.carousalSubTitleWidgetBlueText,
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: ScreenConstant.defaultWidthTen,
//               vertical: ScreenConstant.defaultHeightForty),
//           child: ListView(
//             children: [
//               Obx(
//                 () => Stack(children: [
//                   Positioned(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(30),
//                       child: SizedBox(
//                         width: Get.width,
//                         height: ScreenConstant.screenHeightHalf,
//                         child: Image.file(
//                           fit: BoxFit.fitWidth,
//                           File(controller.temporaryDocImagePath.value.isEmpty
//                               ? data[3]
//                               : controller.temporaryDocImagePath.value),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: ScreenConstant.defaultHeightThirty,
//                       right: ScreenConstant.defaultWidthThirty,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: controller.temporaryDocImagePath.value.isEmpty
//                                 ? CustomColor.alertDialogButton
//                                 : CustomColor.orange),
//                         child: IconButton(
//                           icon: Icon(
//                               controller.temporaryDocImagePath.value.isEmpty
//                                   ? Icons.edit
//                                   : Icons.close),
//                           color: CustomColor.white,
//                           onPressed: () {
//                             if (controller.temporaryDocImagePath.value.isEmpty) {
//                               chooseCameraOrGalleryModalBottomSheetMenu(context,
//                                   (XFile? selectedImage) async {
//                                 controller.temporaryDocImageName.value =
//                                     selectedImage!.name;
//                                 controller.temporaryDocImagePath.value =
//                                     selectedImage.path;
//                               });
//                             } else {
//                               controller.temporaryDocImagePath.value = "";
//                               controller.temporaryDocImageName.value = "";
//                             }
//                           },
//                         ),
//                       ))
//                 ]),
//               ),
//               Container(
//                 height: ScreenConstant.defaultHeightTen,
//               ),
//               Text(AppStrings.title.tr,style: context.textTheme.titleMedium,),
//               Container(
//                 height: ScreenConstant.defaultHeightTen,
//               ),
//               DefaultEditText(
//                 type: Type.stageName,
//                 prefixIcon: Container(),
//                 style: TextStyles.textFieldTextStyleSemiBold,
//                 keyboardType: TextInputType.text,
//                 obscureText: true,
//                 controller: controller.titleEditController,
//                 hintText: data[1],
//               ),
//               Container(
//                 height: ScreenConstant.defaultHeightTen,
//               ),
//               Text(AppStrings.description.tr,style: context.textTheme.titleMedium,),
//               Container(
//                 height: ScreenConstant.defaultHeightTen,
//               ),
//               DefaultEditText(
//                 type: Type.description,
//                 prefixIcon: Container(),
//                 style: TextStyles.textFieldTextStyleSemiBold,
//                 keyboardType: TextInputType.text,
//                 obscureText: true,
//                 controller: controller.descEditController,
//                 hintText: data[2],
//               ),
//               Container(
//                 height: ScreenConstant.defaultHeightTen,
//               ),
//               UniversalButtonWidget(
//                 ontap: () {
//                   controller.updateData(
//                       data[0],
//                       controller.titleEditController.text.isEmpty
//                           ? data[1]
//                           : controller.titleEditController.text,
//                       controller.descEditController.text.isEmpty
//                           ? data[2]
//                           : controller.descEditController.text,
//                       controller.temporaryDocImagePath.value.isEmpty
//                           ? data[3]
//                           : controller.temporaryDocImagePath.value);
//                   controller.descEditController.text = "";
//                   controller.titleEditController.text = "";
//                   controller.temporaryDocImagePath.value = "";
//                   controller.temporaryDocImageName.value = "";
//                   Get.back();
//                 },
//                 color: Get.theme.dividerColor,
//                 margin: EdgeInsets.symmetric(
//                   vertical: ScreenConstant.defaultHeightFifteen,
//                   horizontal: ScreenConstant.defaultWidthTwenty,
//                 ),
//                 leadingIconvisible: true,
//                 title: AppStrings.updateVlog.tr,
//                 titleTextStyle:
//                     TextStyles.textStyleRegular.apply(color: CustomColor.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
