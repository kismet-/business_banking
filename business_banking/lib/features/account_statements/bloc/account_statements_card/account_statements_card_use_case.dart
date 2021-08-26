import 'package:business_banking/features/account_statements/bloc/account_statements_card/account_statements_card_service_adapter.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_card_entity.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_card_view_model.dart';
import 'package:business_banking/features/account_statements/model/service_status.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsCardUseCase extends UseCase {
  late final ViewModelCallback<AccountStatementsCardViewModel>
      _viewModelCallBack;

  AccountStatementsCardUseCase(
    ViewModelCallback<AccountStatementsCardViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  Future<void> execute() async {
    RepositoryScope? _scope = ExampleLocator()
        .repository
        .containsScope<AccountStatementsCardEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<AccountStatementsCardEntity>(
          new AccountStatementsCardEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, AccountStatementsCardServiceAdapter());
    } else {
      _scope.subscription = _notifySubscribers;
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  AccountStatementsCardViewModel buildViewModel(
    AccountStatementsCardEntity entity,
  ) {
    if (entity.hasErrors()) {
      return AccountStatementsCardViewModel(
        accountInfo: entity.accountInfo,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return AccountStatementsCardViewModel(
        accountInfo: entity.accountInfo,
        serviceResponseStatus: ServiceResponseStatus.succeeded,
      );
    }
  }
}
