import 'package:hive/hive.dart';

class HiveService {
  static var _boxName = Hive.box("userData");

  static storeInfo({required String email, required String password}) {
    _boxName.put("email", email);
    _boxName.put("password", password);
    print("Saved succesfully");
  }

  static getData() {
    String email = _boxName.get("email", defaultValue: "No email found");
    String password =
        _boxName.get("password", defaultValue: "No password found");
    return {"email": email, "password": password};
  }
}
