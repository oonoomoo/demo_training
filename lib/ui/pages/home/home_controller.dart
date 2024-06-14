import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:get/get.dart' hide Response;
import 'package:uuid/uuid.dart';
import 'package:work_shop/models/card_data.dart';
import 'package:work_shop/models/product.dart';
import 'package:work_shop/ui/routes/routes.dart';

class HomeController extends GetxController {
  final data = <CardData>[].obs;
  var uuid = const Uuid();
  final dio = Dio();

  @override
  void onInit() {
    initItem();
    getAllProduct();
  }

  Future<void> initItem() async {
    // data.add(
    //     CardData(id: uuid.v4(), title: 'do something 1', desc: 'Description'));
    // data.add(
    //     CardData(id: uuid.v4(), title: 'do something 2', desc: 'Description'));
  }

  Future<void> getAllProduct() async {
    // Make a GET request to the API
    // final response =
    //     await dio.get("https://jsonplaceholder.typicode.com/todos/1");
    // final response = await getAsync("https://fakestoreapi.com/products");

    final response = await dio.get("https://fakestoreapi.com/products");
    // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
    var produce = (response.data as List)
        .map((element) => Product.fromJson(element))
        .toList();

    data.assignAll(produce
        .map((e) => CardData(
            title: e.title ?? '',
            imgUrl: e.image ?? '',
            id: e.id != null ? e.id.toString() : '',
            desc: e.description ?? ''))
        .toList());
  }

  Future<Response> getAsync(String path) {
    return dio.get(path);
  }

  Future<void> addCard() async {
    log('add card');
    var result = await Get.toNamed(AppRoutes.form, arguments: {'mode': 'add'});
    if (result != null) {
      data.add(CardData(
          id: result.id,
          imgUrl: result.imgUrl,
          title: result.title,
          desc: result.desc));
    }
  }

  Future<void> editCard(CardData values) async {
    log('edit card');
    var result = await Get.toNamed(AppRoutes.form,
        arguments: {'mode': 'edit', 'data': values});

    if (result != null) {
      int cardIndex = data.indexWhere((element) => element.id == values.id);
      data[cardIndex] = CardData(
          id: result.id,
          imgUrl: result.imgUrl,
          desc: result.desc,
          title: result.title);
    }
  }

  Future<void> deleteCard(String id) async {
    data.removeWhere((element) => element.id == id);
  }
}
