import 'package:business_banking/features/account_statements/bloc/account_statements_bloc.dart';
import 'package:business_banking/features/account_statements/ui/account_statements_card/account_statements_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AccountStatementsCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountStatementsBloc>(
      key: const Key('AccountStatements-bloc-provider'),
      create: (_) => AccountStatementsBloc(),
      child: AccountStatementsCardPresenter(),
    );
  }
}
