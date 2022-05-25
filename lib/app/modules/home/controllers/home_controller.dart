import 'dart:core';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  getDataFromExcel() async {
    ByteData data = await rootBundle.load("assets/users.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    int j = 0;

    Map<int, List<Data?>> map = Map<int, List<Data?>>();

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        map[++j] = row;
      }
    }

    print(map[1]);
  }
}
