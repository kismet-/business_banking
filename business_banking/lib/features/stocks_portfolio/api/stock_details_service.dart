import 'package:business_banking/features/stocks_portfolio/api/stock_details_request_model.dart';
import 'package:business_banking/features/stocks_portfolio/api/stock_details_responseModel.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsService
    extends EitherService<StockDetailsRequestModel, StockDetailsResponseModel> {
  StockDetailsService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'stock-details');

  @override
  StockDetailsResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return StockDetailsResponseModel.fromJson(jsonResponse);
  }
}