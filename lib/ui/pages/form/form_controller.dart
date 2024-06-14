import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_shop/models/card_data.dart';

class FormController extends GetxController {
  late TextEditingController txtTitleController;
  late TextEditingController txtDescController;
  late TextEditingController txtImgUrlController;

  final String argMode = Get.arguments['mode'];
  final CardData? argData = Get.arguments['data'];

  @override
  void onInit() {
    txtTitleController =
        TextEditingController(text: argMode == 'edit' ? argData?.title : '');
    txtDescController =
        TextEditingController(text: argMode == 'edit' ? argData?.desc : '');
    txtImgUrlController =
        TextEditingController(text: argMode == 'edit' ? argData?.imgUrl : '');
  }
}
