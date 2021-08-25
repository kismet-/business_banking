import 'package:equatable/equatable.dart';

class AccountInfo extends Equatable {
  final String accountNumber;
  final double balance;

  AccountInfo({
    required this.accountNumber,
    required this.balance,
  });

  @override
  List<Object?> get props => [
        accountNumber,
        balance,
      ];
}
