import 'package:business_banking/features/account_statements/bloc/account_statements_card/account_statements_card_event.dart';
import 'package:business_banking/features/account_statements/bloc/account_statements_card_use_case.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class AccountStatementsBloc extends Bloc {
  late final AccountStatementsCardUseCase? _cardUseCase;

  final cardEventPipe =
      Pipe<AccountStatementsCardEvent>(canSendDuplicateData: true);
  final accountStatementsScreenEventPipe =
      Pipe<AccountStatementsScreenEvent>(canSendDuplicateData: true);

  final cardViewModelPipe = Pipe<AccountStatementsViewModel>();

  AccountStatementsBloc({
    AccountStatementsCardUseCase? accountStatementCardUseCase,
  }) {
    _cardUseCase = accountStatementCardUseCase ??
        AccountStatementsCardUseCase(cardViewModelPipe.send);
    cardViewModelPipe.whenListenedDo(() => _cardUseCase!.execute());
    cardEventPipe.receive.listen(cardEventPipeHandler);
  }

  void cardEventPipeHandler(AccountStatementsCardEvent event) {}

  @override
  void dispose() {
    cardViewModelPipe.dispose();
    cardEventPipe.dispose();
  }
}
