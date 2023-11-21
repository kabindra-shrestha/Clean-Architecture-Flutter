import '../../../core/constants/nums.dart';
import '../../../core/constants/strings.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String sources;
  final int page;
  final int pageSize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.sources = 'bbc-news, abc-news',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
