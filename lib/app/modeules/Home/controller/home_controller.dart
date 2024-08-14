import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/global_dialog.dart';
import '../../../../database/db_helper.dart';
import '../../../../models/books_model.dart';
import '../../../../utils/text_utils/app_strings.dart';
import '../../../../utils/utils.dart';
import '../home_service/homeService.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  //for controlling the smooth animation while showing the home and drawer.
  late final AnimationController animationController;
  //for toggle between drawer and home UI.
  RxBool toggleValue = false.obs;
  //for fetching all data from db.
  RxList<Map<String, dynamic>> allData = <Map<String, dynamic>>[].obs;
  //for showing circular progress indicator if needed while loading some data .
  RxBool isLoading = false.obs;
  //variables for all the text form fields.
  final TextEditingController handleController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  //variables for storing the image path and image name after get the image either from gallery or camera.
  RxString temporaryDocImageName = "".obs;
  RxString temporaryDocImagePath = "".obs;


@override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    refreshData();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  //refresh data's after add or update or delete.
  void refreshData() async {
    final data = await SQLHelper.getAllData();
    allData.value = data;
    isLoading.value = false;
  }
  //add data to db
 Future<void> addData(String title, String desc,String image) async {
  await SQLHelper.createData(title, desc,image);
  refreshData();
 }
  //update data to db.
  Future<void> updateData(int id,String title,String description,String image) async {
    await SQLHelper.updateData(id,title, description,image);
    refreshData();
    Get.back();
  }
  //delete data from db.
  Future<void> deleteData(int id) async {
    await SQLHelper.deleteData(id);
    showSuccessSnackbar("Item deleted", "Deletion successful.");
    refreshData();
  }

  toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
  final HomeService _homeService = HomeService();
  BooksModel booksModel = BooksModel();
  RxList<BooksLists> getBooksList =
      <BooksLists>[].obs;
  Future<void> booksListFetch() async {
    print("booksListFetch");
      isLoading.value = true;


    if (await networkCheck()) {
      isLoading.value = false;
      Get.dialog(const GlobalDialog(text: AppStrings.noNetworkFound));
      return;
    }

    try {
      booksModel = await _homeService.booksListFetch();
      print(booksModel.toJson());

      // if (taskListModel.status == "success") {
      //   forDevelopmentNumberOfApiCalled.value =
      //       forDevelopmentNumberOfApiCalled.value + 1;
      //   isLoading.value = false;
      //   isLoadingForInitial.value = false;
      //   taskList.clear();
      //   taskListForMaintenance.clear();
      //   filteredTaskList.clear();
      //   filteredTaskListForMaintenance.clear();
      //
      //   // Check if taskListModel.result is not null and not empty
      if (booksModel.data != null && booksModel.data!.isNotEmpty) {
        final List<BooksLists> results = booksModel.data!;
        final dbHelper = SQLHelper();

        for (var result in results) {
          final task = BooksLists(
            id: result.id,
            title: result.title,
            handle: result.handle,
            iSBN: result.iSBN,
            pages: result.pages,
            publisher: result.publisher,
            year: result.year,
          );

          // Check if the book_id is present in the booksDeleted table
          if (!await dbHelper.isBookDeleted(task.id)) {
            // Check if the book already exists in the book table
            if (!await dbHelper.bookExixts(task.id)) {
              await dbHelper.insertBooks(task);
            }
          }
        }

        final dbTasks = await SQLHelper().fetchBooks();
        getBooksList.clear();
        getBooksList.addAll(dbTasks);
        print("==>getTasksWorkerListLength:${getBooksList.length}");

          // Filter tasks based on task_category
          // var harvestingTasks = taskListModel.result!
          //     .where((task) => task.taskCategoryName == "Maintenance")
          //     .toList();
          // taskListForMaintenance.addAll(harvestingTasks);
          // filteredTaskListForMaintenance.addAll(harvestingTasks);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          // Handle the case when the result is empty or null
        }
      //
      //   if (isRouteTrue) {
      //     Get.toNamed(Routes.TASKSSCREEN);
      //   }
      //
      //   print(taskList.length);
      // } else {
      //   isLoading.value = false;
      //   isLoadingForInitial.value = false;
      //   Get.dialog(const GlobalDialog(text: AppStrings.somethingWentWrong));
      // }
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      print("Error fetching tasks: $error");
      Get.dialog(GlobalDialog(text: "Error fetching tasks: $error"));
    }
  }
  void refreshBooksList() async {
    final dbTasks = await SQLHelper().fetchBooks();
    getBooksList.clear();
    getBooksList.addAll(dbTasks);
    getBooksList.refresh();
  }
  //For checking the internet connectivity
  Future<bool> networkCheck() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } on SocketException catch (_) {
      return true;
    }
  }
}