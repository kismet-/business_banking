import 'package:business_banking/features/account_statements/api/account_statements_get_response_model.dart';
import 'package:business_banking/features/account_statements/api/account_statements_get_service.dart';
import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_card_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsCardServiceAdapter extends ServiceAdapter<
    AccountStatementsCardEntity,
    JsonRequestModel,
    AccountStatementsGetServiceResponseModel,
    AccountStatementsGetService> {
  AccountStatementsCardServiceAdapter() : super(AccountStatementsGetService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      accountInfo: AccountInfo(
        accountNumber: responseModel.accountNumber,
        balance: responseModel.balance,
      ),
    );
  }
}
