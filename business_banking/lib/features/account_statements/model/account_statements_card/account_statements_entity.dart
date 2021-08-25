import 'package:business_banking/features/account_statements/api/account_statements_get_response_model.dart';
import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsEntity extends Entity {
  final AccountInfo accountInfo;

  static const kErrorsDefault = <EntityFailure>[];
  static const kAccountNumberDefault =
      AccountStatementsGetServiceResponseModel.kAccountNumberDefault;
  static const kBalanceDefault =
      AccountStatementsGetServiceResponseModel.kBalanceDefault;

  AccountStatementsEntity({
    List<EntityFailure> errors = kErrorsDefault,
    AccountInfo? accountInfo,
  })  : accountInfo = accountInfo ??
            AccountInfo(
              accountNumber: kAccountNumberDefault,
              balance: kBalanceDefault,
            ),
        super(errors: errors);

  AccountStatementsEntity merge({
    List<EntityFailure>? errors,
    AccountInfo? accountInfo,
  }) {
    return AccountStatementsEntity(
      errors: errors ?? this.errors,
      accountInfo: accountInfo ?? this.accountInfo,
    );
  }
}
