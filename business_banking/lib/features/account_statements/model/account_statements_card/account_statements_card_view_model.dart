import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:business_banking/features/account_statements/model/service_status.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsCardViewModel extends ViewModel {
  final AccountInfo accountInfo;
  final ServiceResponseStatus serviceResponseStatus;

  static const kServiceResponseStatusDefault = ServiceResponseStatus.unknown;
  static const kDeadlineErrorMessageDefault = null;

  AccountStatementsCardViewModel({
    required this.accountInfo,
    this.serviceResponseStatus = kServiceResponseStatusDefault,
  });

  @override
  List<Object?> get props => [accountInfo, serviceResponseStatus];
}
