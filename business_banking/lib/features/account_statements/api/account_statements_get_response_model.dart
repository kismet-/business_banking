import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsGetServiceResponseModel extends JsonResponseModel {
  final String accountNumber;
  final double balance;
  final List transactions;

  static const kAccountNumberDefault = '';
  static const kBalanceDefault = 0.0;

  AccountStatementsGetServiceResponseModel(
      {required this.accountNumber,
      required this.balance,
      required this.transactions});

  factory AccountStatementsGetServiceResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AccountStatementsGetServiceResponseModel(
        accountNumber: json['accountNumber'] ?? kAccountNumberDefault,
        balance: json['balance'] ?? kBalanceDefault,
        transactions: json['transactions']);
  }

  @override
  List<Object?> get props => [
        accountNumber,
        balance,
        transactions,
      ];
}