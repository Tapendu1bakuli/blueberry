import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../common/widgets/universal_button_widget.dart';
import '../../../../database/db_helper.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/TextStyles.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/common_text_form_field.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../controller/home_controller.dart';
import 'drawer_data_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    Uint8List bytes;
    return PopScope(
      canPop: false,
      child: Obx(
        () => Stack(
          children: [
            AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  double slide =
                      rightSlide * controller.animationController.value +
                          ScreenConstant.defaultHeightFifteen;
                  double scale =
                      1.1 - (controller.animationController.value * 0.3);
                  return Stack(
                    children: [
                      const Scaffold(
                        backgroundColor: CustomColor.primaryBlue,
                        body: DrawerDataScreen(),
                      ),
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(slide)
                          ..scale(scale),
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.only(
                              right: ScreenConstant.defaultWidthThirty),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: CustomColor.secondaryBlue,
                                spreadRadius: 30,
                                blurRadius: 50,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Scaffold(
                              body: ListView(
                            children: [
                              Container(
                                height: ScreenConstant.defaultHeightThirty,
                              ),
                              AppBar(
                                scrolledUnderElevation: 0.0,
                                title: Text(
                                  AppStrings.welcome,
                                  style:
                                      TextStyles.carousalSubTitleWidgetBlueText,
                                ),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        controller.titleController.text = "";
                                        controller.handleController.text = "";
                                        controller.yearController.text = "";
                                        controller.pagesController.text = "";
                                        controller.publisherController.text = "";
                                        controller.isbnController.text = "";
                                       Get.toNamed(Routes.ADDNEWBOOKS);
                                      },
                                      icon: const Icon(Icons.add)),
                                  IconButton(
                                      onPressed: () {
                                        controller.booksListFetch();
                                      },
                                      icon: const Icon(Icons.sync))
                                ],
                                centerTitle: false,
                                leading: Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenConstant.defaultWidthTen),
                                  child: IconButton(
                                    onPressed: () =>
                                        controller.toggleAnimation(),
                                    icon: AnimatedIcon(
                                      icon: AnimatedIcons.menu_close,
                                      color: CustomColor.white,
                                      progress: controller.animationController,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenConstant.defaultHeightTen,
                              ),
                              Obx(
                                () => controller.getBooksList.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: ScreenConstant
                                                .defaultWidthTwenty),
                                        child: Row(
                                          children: [
                                            Text(
                                              AppStrings.listsOfBooks.tr,
                                              style:
                                                  context.textTheme.titleMedium,
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${AppStrings.numberOfBooks.tr} ${controller.getBooksList.length}",
                                              style:
                                                  context.textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      )
                                    : const Offstage(),
                              ),
                              Obx(
                                () => controller.getBooksList.isNotEmpty
                                    ? ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.getBooksList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () async {
                                              controller.publisherController.text = "";
                                              controller.handleController.text = "";
                                              controller.pagesController.text = "";
                                              controller.isbnController.text = "";
                                              Get.toNamed(
                                                  Routes.BOOKDESCRIPTION,
                                                  arguments: [
                                                    controller
                                                        .getBooksList[index]
                                                        .title,
                                                    controller
                                                        .getBooksList[index]
                                                        .year,
                                                    controller
                                                        .getBooksList[index]
                                                        .handle,
                                                    controller
                                                        .getBooksList[index]
                                                        .publisher,
                                                    controller
                                                        .getBooksList[index]
                                                        .iSBN,
                                                    controller
                                                        .getBooksList[index]
                                                        .pages,
                                                    controller
                                                        .getBooksList[index].id
                                                  ]);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: ScreenConstant
                                                      .defaultWidthTen,
                                                  vertical: ScreenConstant
                                                      .defaultHeightTen),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: ScreenConstant
                                                      .defaultHeightFifteen),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: CustomColor.homeGrey
                                                      .withOpacity(0.1)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: ScreenConstant
                                                        .defaultWidthTwenty),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        controller
                                                            .getBooksList[index]
                                                            .title,
                                                        style: TextStyles
                                                            .subtitleSmall
                                                            .copyWith(
                                                                color: CustomColor
                                                                    .primaryBlack
                                                                    .withOpacity(
                                                                        0.8),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                        onPressed: () async {
                                                          final bookId =
                                                              controller
                                                                  .getBooksList[
                                                                      index]
                                                                  .id;

                                                          // Insert the book id into the booksDeleted table
                                                          await SQLHelper()
                                                              .insertBooksDeleted(
                                                                  bookId);

                                                          // Delete the book from the book table
                                                          await SQLHelper()
                                                              .deleteBookByIdOrTitle(
                                                                 bookId: bookId,title:controller
                                                              .getBooksList[
                                                          index]
                                                              .title);
                                                          controller
                                                              .refreshBooksList();
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: CustomColor
                                                              .orange,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                    : const Center(
                                        child: Text(
                                            "Tap on sync button to get books first time!!"),
                                      ),
                              ),
                              Container(
                                height: ScreenConstant.defaultHeightForty,
                              )
                            ],
                          )),
                        ),
                      ),
                    ],
                  );
                }),
            controller.isLoading.value
                ? Container(
                    color: CustomColor.buttonDarkColor.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const Offstage()
          ],
        ),
      ),
    );
  }
}
