import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_db/model/user_model.dart';

class HiveService {
  static final _boxName = Hive.box("userData");

  static storeInfo({required String email, required String password, required String firstName, required String lastName}) {
    _boxName.put("email", email);
    _boxName.put("password", password);
  }

  static getData() {
    String email = _boxName.get("email", defaultValue: "No email found");
    String password =
    _boxName.get("password", defaultValue: "No password found");
    return {"email": email, "password": password};
  }

 static saveObject({required var obj, required String objKey}) {
  try {
    String objString = jsonEncode(obj);
    _boxName.put(objKey, objString);
    print("Object saved successfully");
  } catch (e) {
    print("Error saving object: $e");
  }
}

 static User? getObject({required String objectKey}) {
  String? userString = _boxName.get(objectKey);
  if (userString == null) {
    return null;
  }
  Map<String, dynamic> objMap = jsonDecode(userString);
  User user = User.fromJson(map: objMap);
  return user;
}

  static deleteObject({required String objectKey}) {
    _boxName.delete(objectKey);
    print("Deleted successfully");

  }
}