import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserFile {
  _getUserFile() async {
    final dir = await getApplicationSupportDirectory();
    return File("${dir.path}/user_data.txt");
  }

 saveUser(String username, String password) async {
    final file = await _getUserFile();

    final data = "username: $username, password: $password";

    await file.writeAsString(data);
  }

   readUser() async {
    try {
      final file = await _getUserFile();
      if (!await file.exists()) return null;

      final text = await file.readAsString();

      List<String> parts = text.split(",");

      String username = "";
      String password = "";

      for (String part in parts) {
        List<String> KeyVal = part.split(":");

        if (KeyVal.length == 2) {
          String key = KeyVal[0].trim();
          String value = KeyVal[1].trim();

          if (key == "username") username = value;
          if (key == "password") password = value;
        }
      }

      return {
        "username": username,
        "password": password,
      };
    } catch (e) {
      return null;
    }
  }
}
