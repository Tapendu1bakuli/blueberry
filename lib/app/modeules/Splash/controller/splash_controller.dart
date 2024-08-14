import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/Store/HiveStore.dart';

class SplashController extends GetxController{
  RxBool isLoading = false.obs;
  void onReady() {
    print("OnReady");
    _saveDeviceToken();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('notification_icon');
    var initializationSettingsIOS = new DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {},
    );
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android;
      AppleNotification ios;
      if (GetPlatform.isIOS) {
        ios = message.notification!.apple!;
        if (notification != null && ios != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              const NotificationDetails(
                iOS: DarwinNotificationDetails(),
              ));
        }
      } else {
        android = message.notification!.android!;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  //color: AppColors.primaryColor,
                  icon: 'notification_icon',
                ),
              ));
        }
      }
      print("Message : ${message.data}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    if(HiveStore().getBool(Keys.ISDARK) == null){
      HiveStore().setBool(Keys.ISDARK,false);
    }
    HiveStore().getBool(Keys.ISDARK) == true?
    Get.changeThemeMode(ThemeMode.dark):Get.changeThemeMode(ThemeMode.light);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Timer(const Duration(seconds: 3), () async {
      Get.offAllNamed(Routes.HOME);
      print("Route Home");
    });
    super.onReady();
  }
  _saveDeviceToken() async {
    await HiveStore().initBox();
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM token : $fcmToken");
    if (fcmToken != null) {
      await HiveStore().put(Keys.FCM, fcmToken);
      // Hive.box(HiveString.hiveName).put(HiveString.fcmToken,fcmToken);
    }
  }
}
