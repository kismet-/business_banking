import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'MODEL TEST: On success NewsDetailsViewModel should initialize.', () async {
    final viewModel = NewsDetailsViewModel(
        author: 'author',
        title: 'title',
        description: 'description',
        url: 'url',
        urlToImage: 'urlToImage',
        publishedAt: 'publishedAt');
    expect(viewModel.props,
        ['author', 'title', 'description', 'url', 'urlToImage', 'publishedAt']);
    expect(viewModel.stringify, false);
    expect(viewModel.author, 'author');
    expect(viewModel.title, 'title');
    expect(viewModel.description, 'description');
    expect(viewModel.url, 'url');
    expect(viewModel.urlToImage, 'urlToImage');
    expect(viewModel.publishedAt, 'publishedAt');
  });
}
