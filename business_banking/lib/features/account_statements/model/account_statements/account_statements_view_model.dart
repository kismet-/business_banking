import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsViewModel extends ViewModel {
  final AccountInfo? accountInfo;
  final String formStartDate;
  final String? formEndDate;
  final List transactions;

  AccountStatementsViewModel({
    required this.accountInfo,
    required this.formStartDate,
    this.formEndDate,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
        accountInfo,
        formStartDate,
        formEndDate,
        transactions,
      ];
}
