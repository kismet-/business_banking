import 'package:business_banking/features/account_statements/bloc/account_statements_bloc.dart';
import 'package:business_banking/features/account_statements/ui/account_statements/account_statements_screen_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class AccountStatementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountStatementsBloc>(
      key: const Key('AccountStatements-bloc-provider'),
      create: (_) => AccountStatementsBloc(),
      child: AccountStatementsPresenter(),
    );
  }
}
