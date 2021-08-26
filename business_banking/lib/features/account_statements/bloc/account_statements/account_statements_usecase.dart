import 'package:business_banking/features/account_statements/bloc/account_statements/account_statements_service_adapter.dart';
import 'package:business_banking/features/account_statements/model/account_info.dart';
import 'package:business_banking/features/account_statements/model/account_statements/account_statements_entity.dart';
import 'package:business_banking/features/account_statements/model/account_statements/account_statements_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsUseCase extends UseCase {
  late final ViewModelCallback<AccountStatementsViewModel> _viewModelCallBack;

  RepositoryScope? _scope;

  AccountStatementsUseCase(
    ViewModelCallback<AccountStatementsViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  Future<void> execute() async {
    _scope =
        ExampleLocator().repository.containsScope<AccountStatementsEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<AccountStatementsEntity>(
            AccountStatementsEntity(),
            _notifySubscribers,
          );
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    final entity = ExampleLocator().repository.get<AccountStatementsEntity>(
          _scope!,
        );
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  AccountStatementsViewModel buildViewModel(
    AccountStatementsEntity entity,
  )

    if (entity.hasErrors()) {
      // TODO: check.
      return AccountStatementsViewModel(
        accountInfo: entity.accountInfo,
        formStartDate: entity.formStartDate,
        formEndDate: entity.formEndDate,
        transactions: entity.transactions,
      );
    } else {
      return AccountStatementsViewModel(
          accountInfo: entity.accountInfo,
          formStartDate: entity.formStartDate,
          formEndDate: entity.formEndDate,
          transactions: entity.transactions);
    }
  }


}
