
import 'package:blueberry/routes/app_pages.dart';
import 'package:blueberry/utils/Store/HiveStore.dart';
import 'package:blueberry/utils/theme/settings_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'languages/LocalizationService.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
void main() async {
  SettingsService settingsService = Get.put(SettingsService());
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore().initBox();
  await Firebase.initializeApp(
    //  options: DefaultFirebaseOptions.currentPlatform,
  );
  if (!GetPlatform.isWeb) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();

  await HiveStore().initBox();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GetMaterialApp(
    translations: LocalizationService(),
    supportedLocales: LocalizationService.locales,
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    defaultTransition: Transition.cupertino,
    debugShowCheckedModeBanner: false,
    initialRoute:Theme1AppPages.INITIAL,
    getPages: Theme1AppPages.routes,
     themeMode: settingsService.getThemeMode(),
     theme: settingsService.getLightTheme(),
     darkTheme: settingsService.getDarkTheme(),
  ),
  );
}

