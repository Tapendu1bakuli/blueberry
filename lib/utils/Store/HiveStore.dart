import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../Store/vm.dart';

class Keys {
  static const String ISDARK = "false";
  static const String RAPS = 'RAPS';
  static const String WINNERS = 'WINNERS';
  static const String language = 'Language';
  static const String NEWUSER = "newUser";
  static const String USERID = "userId";
  static const String NICKNAME = "nickName";
  static const String FIRSTNAME = "firstName";
  static const String LASTNAME = "lastName";
  static const String EMAIL = "email";
  static const String STYLE = "style";
  static const String AGE = "age";
  static const String COUNTRY = "country";
  static const String PROFILEIMAGE = "profileImage";
  static const String MBTI = "mbti";
  static const String AUTHORIZATIONTOKEN = "authorizationToken";
  static const String WALLETID   = "walletId";
  static const String FCM   = "FCM";
}

class HiveStore {
  //Singleton Class
  static final HiveStore _default = new HiveStore._internal();
  static late Box defBox;

  factory HiveStore() {
    return _default;
  }

  HiveStore._internal();

  static getInstance() {
    return _default;
  }

  initBox() async {
    defBox = await (openBox());
  }

  //Object Storage
  put(String key, Object value) async {
    defBox.put(key, value);
    print("HiveStored : Key:$key, Value:$value");
  }

  get(String key) {
    // print("Box is Open? ${defBox.isOpen}");
    print("Hive Retrieve : Key:$key, Value:${defBox.get(key)}");
    return defBox.get(key);
  }

  //String Storage
  setString(String key, String value) async {
    defBox.put(key, value);
    print("HiveStored : Key:$key, Value:$value");
  }

  getString(String key) {
    print("Hive Retrieve : Key:$key, Value:${defBox.get(key)}");
    return defBox.get(key);
  }

  //Bool Storage
  setBool(String key, bool value) async {
    defBox.put(key, value);
    print("HiveStored : Key:$key, Value:$value");
  }

  getBool(String key) {
    print("Hive Retrieve : Key:$key, Value:${defBox.get(key)}");
    return defBox.get(key);
  }

  clear() {
    defBox.clear();
  }

  remove(String key) async {
    defBox.delete(key);
  }

  Future openBox() async {
    if (!isBrowser) {
      var dir = await getApplicationDocumentsDirectory();
      Hive
        ..init(dir
            .path) /*..registerAdapter(ScheduleReminderAdapter(),override: true,internal: true)*/;
    }
    return await Hive.openBox('Store');
  }
}
