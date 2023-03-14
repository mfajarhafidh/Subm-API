import 'package:get/get.dart';
import 'package:submission/infrastructure/navigation/bindings/domains/article_repository_binding.dart';

import '../../../../../presentation/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final homeRepositoryBinding = HomeRepositoryBinding();
    Get.lazyPut<HomeController>(
      () => HomeController(articleRepository: homeRepositoryBinding.repository),
    );
  }
}
