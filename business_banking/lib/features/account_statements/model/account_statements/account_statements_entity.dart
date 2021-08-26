import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:intl/intl.dart';

class AccountStatementsEntity extends Entity {
  final AccountInfo? accountInfo;
  final String formStartDate;
  final String formEndDate;
  final List transactions;

  static const kErrorsDefault = <EntityFailure>[];
  static final kFormStartDate = DateFormat('MM/dd/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1));
  static final kFormEndDate = DateFormat('MM/dd/yyyy').parse(
    '12/31/1969',
  );
  static const kReferenceNumberDefault = '';

  AccountStatementsEntity._({
    List<EntityFailure> errors = kErrorsDefault,
    this.accountInfo,
    required this.formStartDate,
    required this.formEndDate,
    required this.transactions,
  }) : super(errors: errors);

  factory AccountStatementsEntity({
    List<EntityFailure> errors = kErrorsDefault,
    AccountInfo? accountInfo,
    String? formStartDate,
    String? formEndDate,
    List? transactions,
  }) {
    return AccountStatementsEntity._(
      errors: errors,
      accountInfo: accountInfo,
      formStartDate: formStartDate ?? kFormStartDate,
      formEndDate: formEndDate ?? kFormEndDate,
      transactions: transactions,
    );
  }

  AccountStatementsEntity merge({
    List<EntityFailure>? errors,
    AccountInfo? accountInfo,
    String? formGoal,
    String? formDeadline,
    String? transactions,
  }) {
    return AccountStatementsEntity(
        errors: errors ?? this.errors,
        accountInfo: accountInfo ?? this.accountInfo,
        formStartDate: formGoal ?? '${this.formStartDate}',
        formEndDate: this.formEndDate,
        transactions: this.transactions);
  }
}
