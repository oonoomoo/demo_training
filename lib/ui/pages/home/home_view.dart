import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:work_shop/ui/components/button.dart';
import 'package:work_shop/ui/pages/home/components/my_card.dart';
import 'package:work_shop/ui/pages/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
      ),
      // body: _buildListView(),
      body: _buildSingleChildScrollView(),
    );
  }

  Widget _buildNoData() {
    return const SizedBox();
  }

  Widget _buildListView() {
    return ListView(
      children: [
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Card'),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() => ctrl.data.isNotEmpty
            ? Wrap(
                // runSpacing: 0,
                children: [
                  ...ctrl.data.map((element) => MyCard(
                        id: element.id,
                        title: element.title,
                        desc: element.desc,
                        imgUrl: element.imgUrl,
                        onDelete: (String id) {
                          ctrl.deleteCard(id);
                        },
                        onEdit: (String id) {
                          ctrl.editCard(element);
                        },
                      )),
                ],
              )
            : _buildNoData()),
      ],
    );
  }

  Widget _buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        'Total : ${ctrl.data.length}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IPrimaryButton(
                      text: 'Add',
                      onPressed: () {
                        ctrl.addCard();
                      },
                    ),
                  ],
                ),
                Obx(() => ctrl.data.isNotEmpty
                    ? Wrap(
                        // runSpacing: 0,
                        children: [
                          ...ctrl.data.map((element) => MyCard(
                                id: element.id,
                                title: element.title,
                                desc: element.desc,
                                imgUrl: element.imgUrl,
                                onDelete: (String id) {
                                  ctrl.deleteCard(id);
                                },
                                onEdit: (String id) {
                                  // ctrl.editCard(id);
                                  ctrl.editCard(element);
                                },
                              )),
                        ],
                      )
                    : _buildNoData()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
