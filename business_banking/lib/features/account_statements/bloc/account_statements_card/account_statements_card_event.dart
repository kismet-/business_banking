import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:equatable/equatable.dart';

abstract class AccountStatementsCardEvent extends Equatable {}

class UpdateAccountInfoEvent implements AccountStatementsCardEvent {
  final AccountInfo accountInfo;

  UpdateAccountInfoEvent(this.accountInfo);

  @override
  List<Object?> get props => [accountInfo];

  @override
  bool? get stringify => true;
}
