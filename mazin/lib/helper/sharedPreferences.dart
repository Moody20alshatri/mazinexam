import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //  initialize
 static late SharedPreferences sharedPref;
  Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }
  // save
 static Future<bool> save (String key, dynamic value) async {
    if(value is String){
       await sharedPref.setString(key, value);
       return true;
    }
     if (value is int){
       await sharedPref.setInt(key, value);
       return true;
    }
    else if (value is double){
       await sharedPref.setDouble(key, value);
       return true;
    }
    else if (value is bool){
       await sharedPref.setBool(key, value);
        return true;
    }
    else {
      return false;
    }

  }
  // get

 static Future<dynamic> get (String key) async {
    return sharedPref.get(key);
  }

 static Future<bool> clearAll () async {
    return await sharedPref.clear();
  }
  // clear
 static Future<bool> delete (String key) async {
    return await sharedPref.remove(key);
  }
  // delete
  
}