// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../main.dart';
//
// class FireBaseMessagingService extends GetxService {
//   Future<FireBaseMessagingService> init() async {
//     await Firebase.initializeApp();
//     FirebaseMessaging.instance
//         .requestPermission(sound: true, badge: true, alert: true);
//     await FirebaseMessaging.instance.setAutoInitEnabled(true);
//     await fcmOnLaunchListeners();
//     await fcmOnResumeListeners();
//     await fcmOnMessageListeners();
//     return this;
//   }
//
//   Future fcmOnMessageListeners() async {
//     Get.showSnackbar(Ui.notificationSnackBar(
//       title: notification.title,
//       message: notification.body,
//       mainButton: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         width: 42,
//         height: 42,
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(42)),
//           child: CachedNetworkImage(
//             width: double.infinity,
//             fit: BoxFit.cover,
//             imageUrl: message.data != null ? message.data['icon'] : "",
//             placeholder: (context, url) => Image.asset(
//               'assets/img/loading.gif',
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//             errorWidget: (context, url, error) => Icon(Icons.error_outline),
//           ),
//         ),
//       ),
//       onTap: (getBar) async {
//         if (message.data['messageId'] != null) {
//           await Get.back();
//           Get.find<RootController>().changePage(2);
//         }
//       },
//     )
//   }
//
//   Future fcmOnLaunchListeners() async {
//
//   }
//
//   Future fcmOnResumeListeners() async {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _notificationsBackground(message);
//     });
//   }
//
//   void _notificationsBackground(RemoteMessage message) {
//
//   }
//
//
//   Future<String?> setDeviceToken() async {
//     return await FirebaseMessaging.instance.getToken();
//   }
//
// }
