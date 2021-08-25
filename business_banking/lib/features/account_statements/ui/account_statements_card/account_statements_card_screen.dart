import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_entity.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_view_model.dart';
import 'package:business_banking/features/account_statements/model/service_status.dart';
import 'package:business_banking/features/account_statements/ui/account_statements_card/account_statements_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

const _cardHeight = 180.0;

class _CardTitle extends StatelessWidget {
  const _CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Account Statements',
      key: const Key('AccountStatementsCard-success-title'),
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AccountStatementsCardScreen extends Screen {
  final AccountStatementsViewModel viewModel;
  final AccountStatementsCardPresenterActions actions;

  AccountStatementsCardScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return viewModel.serviceResponseStatus == ServiceResponseStatus.succeeded
        ? _succeedCard(
            key: Key('AccountStatementsCard-success'),
            viewModel: viewModel,
            actions: actions,
          )
        : _failedCard(
            key: Key('AccountStatementsCard-fail'),
          );
  }
}

class _succeedCard extends StatelessWidget {
  final AccountStatementsViewModel viewModel;
  final AccountStatementsCardPresenterActions actions;

  const _succeedCard({
    Key? key,
    required this.viewModel,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AccountStatementsInfoCard(viewModel: viewModel),
      onTap: () => actions.navigateToAccountStatementsScreen(context),
    );
  }
}

class AccountStatementsInfoCard extends StatelessWidget {
  final AccountStatementsViewModel viewModel;

  const AccountStatementsInfoCard({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  static const labels = [
    'Account number:',
    'Balance:',
  ];

  @override
  Widget build(BuildContext context) {
    final accountNumber = viewModel.accountInfo.accountNumber;
    final accountBalance = viewModel.accountInfo.balance;

    return Container(
      height: _cardHeight,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: _CardTitle(),
              ),
              const Divider(
                key: const Key('AccountStatementsCard-success-divider'),
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _paddedItems(
                        labels.map((String label) => Text(label)).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _paddedItems([
                        Text(
                          _obfuscateAccountNumber(
                            accountNumber,
                          ),
                          key: const Key(
                            'AccountStatementsCard-success-account-number',
                          ),
                        ),
                        Text(
                          '\$$accountBalance',
                          key: const Key(
                            'AccountStatementsCard-success-balance',
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _paddedItems(
    List<Widget> items, [
    double verticalPadding = 2.0,
  ]) {
    return items.map((Widget label) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: label,
      );
    }).toList();
  }

  String _obfuscateAccountNumber(String accountNumber) {
    var number = '';
    if (viewModel.accountInfo.accountNumber !=
        AccountStatementsEntity.kAccountNumberDefault) {
      number = viewModel.accountInfo.accountNumber.substring(
        viewModel.accountInfo.accountNumber.length - 4,
      );
    }
    return 'xxxxxxxxxx' + number;
  }
}

class _failedCard extends StatelessWidget {
  const _failedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _cardHeight,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: _CardTitle(),
              ),
              const Divider(
                key: const Key('AccountStatementsCard-fail-divider'),
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 56.0),
                child: const Text(
                  "Service is not available! Please try again later.",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  key: const Key('AccountStatementsCard-fail-help-message'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
