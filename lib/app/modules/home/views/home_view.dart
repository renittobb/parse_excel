import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=> controller.getDataFromExcel(),
          child: Text('Get Data From Excel'),
        ),
      ),
    );
  }
}
