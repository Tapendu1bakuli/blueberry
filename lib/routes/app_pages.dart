
import 'package:blueberry/routes/routes.dart';
import 'package:get/get.dart';
import '../app/modeules/Home/binding/home_binding.dart';
import '../app/modeules/Home/views/add_new_book.dart';
import '../app/modeules/Home/views/book_description.dart';
import '../app/modeules/Home/views/home_screen.dart';
import '../app/modeules/Splash/binding/splash_binding.dart';
import '../app/modeules/Splash/views/splash_screen.dart';


class Theme1AppPages {
  static const INITIAL = Routes.ROOT;
  static const INITIAL_FOR_HOME_ = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.ROOT,
        page: () => const SplashScreen(),
      binding: SplashBinding(),
       ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.UPDATEDETAILS,
    //   page: () => const UpdateDetailsScreen(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: Routes.BOOKDESCRIPTION,
      page: () =>  BookDescription(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADDNEWBOOKS,
      page: () =>  AddNewBookScreen(),
      binding: HomeBinding(),
    ),
  ];
}