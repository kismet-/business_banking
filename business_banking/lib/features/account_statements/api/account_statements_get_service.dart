import 'package:business_banking/features/account_statements/api/account_statements_get_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsGetService extends EitherService<JsonRequestModel,
    AccountStatementsGetServiceResponseModel> {
  AccountStatementsGetService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-statements');

  @override
  AccountStatementsGetServiceResponseModel parseResponse(
    Map<String, dynamic> jsonResponse,
  ) {
    return AccountStatementsGetServiceResponseModel.fromJson(jsonResponse);
  }
}
