import 'package:business_banking/features/account_statements/api/account_statements_post_request_model.dart';
import 'package:business_banking/features/account_statements/api/account_statements_post_response_model.dart';
import 'package:business_banking/features/account_statements/api/account_statements_post_service.dart';
import 'package:business_banking/features/account_statements/model/account_statements/account_statements_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsServiceAdapter extends ServiceAdapter<
    AccountStatementsEntity,
    AccountStatementsPostServiceRequestModel,
    AccountStatementsPostServiceResponseModel,
    AccountStatementsPostService> {
  AccountStatementsServiceAdapter() : super(AccountStatementsPostService());

  @override
  createEntity(
    AccountStatementsEntity initialEntity,
    AccountStatementsPostServiceResponseModel responseModel,
  ) {
    return initialEntity.merge();
  }

  @override
  AccountStatementsPostServiceRequestModel createRequest(
    AccountStatementsEntity entity,
  ) {
    return AccountStatementsPostServiceRequestModel(
      accountNumber: entity.accountInfo!.accountNumber,
      startDate: entity.formStartDate,
      endDate: entity.formEndDate,
    );
  }
}
