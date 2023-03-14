import 'package:submission/domain/models/article_model.dart';
import 'package:submission/infrastructure/data/services/article_service.dart';

class ArticleRepository {
  final ArticleService _articleService;

  ArticleRepository({required ArticleService articleService})
      : _articleService = articleService;

  Future<ArticleModel> getArticlesRepository() async {
    try {
      final response = await _articleService.getArticleService();
      ArticleModel articles = response;
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}
