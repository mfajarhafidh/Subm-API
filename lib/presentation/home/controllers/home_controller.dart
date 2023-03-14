import 'package:get/get.dart';
import 'package:submission/domain/models/article_model.dart';
import 'package:submission/domain/repository/article_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final ArticleRepository _articleRepository;

  HomeController({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;

  RxBool isLoading = false.obs;
  RxList<Datum> datumList = <Datum>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getArticleController();
  }

  Future<void> getArticleController() async {
    isLoading.toggle();
    try {
      final article = await _articleRepository.getArticlesRepository();
      datumList.addAll(article.data);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> launchBrowser(String value) async {
    final url = Uri.parse(value);
    launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
