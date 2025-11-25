import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Filehelper {
  Future<File> _getFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File("${dir.path}/user.txt");
}

}