import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  late TextEditingController txtTitleController;
  late TextEditingController txtDescController;

  final argMode = Get.arguments['mode'];
  final argData = Get.arguments['data'];

  @override
  void onInit() {
    txtTitleController =
        TextEditingController(text: argMode == 'edit' ? argData.title : '');
    txtDescController =
        TextEditingController(text: argMode == 'edit' ? argData.desc : '');
  }
}
