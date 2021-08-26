import 'package:business_banking/features/account_statements/api/account_statements_post_request_model.dart';
import 'package:business_banking/features/account_statements/api/account_statements_post_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsPostService extends EitherService<
    AccountStatementsPostServiceRequestModel,
    AccountStatementsPostServiceResponseModel> {
  AccountStatementsPostService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'emergency-account');

  @override
  AccountStatementsPostServiceResponseModel parseResponse(
    Map<String, dynamic> jsonResponse,
  ) {
    return AccountStatementsPostServiceResponseModel.fromJson(jsonResponse);
  }
}
