import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CashAccountsViewModel extends ViewModel {
  /// Rest API Accounts Object.
//  final List<cashAccountsEntity> cashAccountsEntity
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String accountStatus;

  CashAccountsViewModel(
      {

      /// List required fields.
      @required this.accountTitle,
      @required this.accountNumber,
      @required this.accountBalance,
      @required this.accountStatus})
      : assert(accountTitle != null &&
            accountNumber != null &&
            accountBalance != null &&
            accountStatus != null);
}