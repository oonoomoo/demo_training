import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_shop/ui/routes/pages.dart';
import 'package:work_shop/ui/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'My First App',
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    ),
  );
}
