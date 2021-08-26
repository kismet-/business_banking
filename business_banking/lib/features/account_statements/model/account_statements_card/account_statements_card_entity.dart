import 'package:business_banking/features/account_statements/api/account_statements_get_response_model.dart';
import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsCardEntity extends Entity {
  final AccountInfo accountInfo;

  static const kErrorsDefault = <EntityFailure>[];
  static const kAccountNumberDefault =
      AccountStatementsGetServiceResponseModel.kAccountNumberDefault;
  static const kBalanceDefault =
      AccountStatementsGetServiceResponseModel.kBalanceDefault;

  AccountStatementsCardEntity({
    List<EntityFailure> errors = kErrorsDefault,
    AccountInfo? accountInfo,
  })  : accountInfo = accountInfo ??
            AccountInfo(
              accountNumber: kAccountNumberDefault,
              balance: kBalanceDefault,
            ),
        super(errors: errors);

  AccountStatementsCardEntity merge({
    List<EntityFailure>? errors,
    AccountInfo? accountInfo,
  }) {
    return AccountStatementsCardEntity(
      errors: errors ?? this.errors,
      accountInfo: accountInfo ?? this.accountInfo,
    );
  }
}
