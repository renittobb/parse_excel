import 'dart:core';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  getFileFromLocal() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    var fileBytes, fileName;
    if (result?.files.first != null) {
      fileBytes = result?.files.first.bytes;
      fileName = result?.files.first.name;
    }

    print('File name: $fileName');

    getDataFromExcel(fileBytes);
  }

  getDataFromExcel(var fileBytes) async {
    // ByteData data =
    //     await rootBundle.load("/Users/renittojose/Downloads/users.xlsx");
    // var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(fileBytes);
    int j = 0;

    Map<int, List<Data?>> map = Map<int, List<Data?>>();

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        map[++j] = row;
      }
    }

    //all the rows here
    print(map);

    //get a row - headers - sample
    map[1]?.forEach((element) {
      print(element?.value);
    });
  }
}
