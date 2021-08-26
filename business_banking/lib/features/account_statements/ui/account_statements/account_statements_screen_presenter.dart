import 'package:business_banking/features/account_statements/bloc/account_statements_bloc.dart';
import 'package:business_banking/features/account_statements/model/account_statements/account_statements_view_model.dart';
import 'package:business_banking/features/account_statements/ui/account_statements/account_statements_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AccountStatementsPresenter extends Presenter<AccountStatementsBloc,
    AccountStatementsViewModel, AccountStatementsScreen> {
  @override
  Stream<AccountStatementsViewModel> getViewModelStream(
    AccountStatementsBloc bloc,
  ) {
    return bloc.accountStatementsViewModelPipe.receive;
  }

  @override
  AccountStatementsScreen buildScreen(
    BuildContext context,
    AccountStatementsBloc bloc,
    AccountStatementsViewModel viewModel,
  ) {
    return AccountStatementsScreen(
      viewModel: viewModel,
      actions: AccountStatementsPresenterActions(
        bloc: bloc,
        viewModel: viewModel,
      ),
    );
  }
}

class AccountStatementsPresenterActions {
  AccountStatementsBloc bloc;
  AccountStatementsViewModel viewModel;

  AccountStatementsPresenterActions({
    required this.bloc,
    required this.viewModel,
  });

  navigateBack(BuildContext context) {
    CFRouterScope.of(context).popUntil(BusinessBankingRouter.hubRoute);
  }

  // onGoalSavedListener(String goal) =>
  //     bloc.editEventPipe.send(UpdateGoalEvent(goal));
  //
  // onDeadlineSavedListener(String deadline) =>
  //     bloc.editEventPipe.send(UpdateDeadlineEvent(deadline));
  //
  // onTapUpdateButton(BuildContext context) {
  //   bloc.editEventPipe.send(UpdateEmergencyFundEvent());
  //   CFRouterScope.of(context).push(
  //     BusinessBankingRouter.EmergencyFundConfirmationRoute,
  //   );
  // }
}
