import 'package:get/get.dart';
import 'package:submission/domain/models/article_model.dart';

class ArticleService {
  final _connect = Get.find<GetConnect>();

  String get _prefix => 'home';

  Future<ArticleModel> getArticleService() async {
    final response = await _connect.get(_prefix,
        decoder: (data) => ArticleModel.fromJson(data));
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar('Error', response.statusCode.toString());
    }
  }
}
