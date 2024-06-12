import 'package:get/get.dart';
import 'package:work_shop/ui/pages/form/form_view.dart';
import 'package:work_shop/ui/pages/home/home_view.dart';
import 'package:work_shop/ui/routes/routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.form, page: () => FormView())
  ];
}
