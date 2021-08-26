import 'package:business_banking/features/account_statements/bloc/account_statements_bloc.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_card_view_model.dart';
import 'package:business_banking/features/account_statements/ui/account_statements_card/account_statements_card_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AccountStatementsCardPresenter extends Presenter<AccountStatementsBloc,
    AccountStatementsCardViewModel, AccountStatementsCardScreen> {
  @override
  Stream<AccountStatementsCardViewModel> getViewModelStream(
    AccountStatementsBloc bloc,
  ) {
    return bloc.cardViewModelPipe.receive;
  }

  @override
  AccountStatementsCardScreen buildScreen(
    BuildContext context,
    AccountStatementsBloc bloc,
    AccountStatementsCardViewModel viewModel,
  ) {
    return AccountStatementsCardScreen(
      viewModel: viewModel,
      actions: AccountStatementsCardPresenterActions(
        bloc: bloc,
        viewModel: viewModel,
      ),
    );
  }
}

class AccountStatementsCardPresenterActions {
  AccountStatementsBloc bloc;
  AccountStatementsCardViewModel viewModel;
  final CFRouter? _router;

  // router parameter: testing only.
  AccountStatementsCardPresenterActions({
    required this.bloc,
    required this.viewModel,
    CFRouter? router,
  }) : _router = router;

  navigateToAccountStatementsScreen(BuildContext context) {
    // bloc.accountStatementsEventPipe
    //     .send(UpdateAccountInfoEvent(viewModel.accountInfo));
    final router = _router ?? CFRouterScope.of(context);
    router.push(BusinessBankingRouter.accountStatementsScreen);
  }
}
