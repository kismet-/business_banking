import 'package:business_banking/features/account_statements/bloc/account_statements/account_statements_event.dart';
import 'package:business_banking/features/account_statements/bloc/account_statements/account_statements_usecase.dart';
import 'package:business_banking/features/account_statements/bloc/account_statements_card/account_statements_card_use_case.dart';
import 'package:business_banking/features/account_statements/model/account_statements/account_statements_view_model.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsBloc extends Bloc {
  late final AccountStatementsCardUseCase? _cardUseCase;
  late final AccountStatementsUseCase? _accountStatementsUseCase;

  final accountStatementsEventPipe =
      Pipe<AccountStatementsEvent>(canSendDuplicateData: true);

  final cardViewModelPipe = Pipe<AccountStatementsCardViewModel>();
  final accountStatementsViewModelPipe = Pipe<AccountStatementsViewModel>();

  AccountStatementsBloc({
    AccountStatementsCardUseCase? accountStatementCardUseCase,
    AccountStatementsUseCase? accountStatementsUseCase,
  }) {
    _cardUseCase = accountStatementCardUseCase ??
        AccountStatementsCardUseCase(cardViewModelPipe.send);
    cardViewModelPipe.whenListenedDo(() => _cardUseCase!.execute());

    _accountStatementsUseCase = accountStatementsUseCase ??
        AccountStatementsUseCase(accountStatementsViewModelPipe.send);
    accountStatementsViewModelPipe
        .whenListenedDo(() => _accountStatementsUseCase!.execute());
    accountStatementsEventPipe.receive.listen(statementsEventPipeHandler);
  }

  void statementsEventPipeHandler(
      AccountStatementsEvent accountStatementsEvent) {}

  @override
  void dispose() {
    cardViewModelPipe.dispose();
  }
}
