import 'dart:developer';

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:work_shop/models/card_data.dart';
import 'package:work_shop/ui/routes/routes.dart';

class HomeController extends GetxController {
  final data = <CardData>[].obs;
  var uuid = const Uuid();

  @override
  void onInit() {
    initItem();
  }

  Future<void> initItem() async {
    data.add(
        CardData(id: uuid.v4(), title: 'do something 1', desc: 'Description'));
    data.add(
        CardData(id: uuid.v4(), title: 'do something 2', desc: 'Description'));
  }

  Future<void> addCard() async {
    log('add card');
    var result = await Get.toNamed(AppRoutes.form, arguments: {'mode': 'add'});
    if (result != null) {
      data.add(CardData(id: result.id, title: result.title, desc: result.desc));
    }
  }

  Future<void> editCard(CardData values) async {
    log('edit card');
    var result = await Get.toNamed(AppRoutes.form,
        arguments: {'mode': 'edit', 'data': values});

    if (result != null) {
      int cardIndex = data.indexWhere((element) => element.id == values.id);
      data[cardIndex] =
          CardData(id: result.id, desc: result.desc, title: result.title);
    }
  }

  Future<void> deleteCard(String id) async {
    data.removeWhere((element) => element.id == id);
  }
}
