import 'package:business_banking/features/account_statements/bloc/account_statements_card/account_statements_card_service_adapter.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_entity.dart';
import 'package:business_banking/features/account_statements/model/account_statements_card/account_statements_view_model.dart';
import 'package:business_banking/features/account_statements/model/service_status.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsCardUseCase extends UseCase {
  late final ViewModelCallback<AccountStatementsViewModel> _viewModelCallBack;

  AccountStatementsCardUseCase(
    ViewModelCallback<AccountStatementsViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  Future<void> execute() async {
    RepositoryScope? _scope =
        ExampleLocator().repository.containsScope<AccountStatementsEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<AccountStatementsEntity>(
          new AccountStatementsEntity(), _notifySubscribers);

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

  AccountStatementsViewModel buildViewModel(
    AccountStatementsEntity entity,
  ) {
    if (entity.hasErrors()) {
      return AccountStatementsViewModel(
        accountInfo: entity.accountInfo,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return AccountStatementsViewModel(
        accountInfo: entity.accountInfo,
        serviceResponseStatus: ServiceResponseStatus.succeeded,
      );
    }
  }
}
