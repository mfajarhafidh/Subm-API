import 'package:submission/domain/repository/article_repository.dart';
import 'package:submission/infrastructure/data/services/article_service.dart';

class HomeRepositoryBinding {
  late ArticleRepository _articleRepository;

  ArticleRepository get repository => _articleRepository;

  HomeRepositoryBinding() {
    final articleService = ArticleService();
    _articleRepository = ArticleRepository(articleService: articleService);
  }
}
