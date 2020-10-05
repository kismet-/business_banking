import 'package:business_banking/features/transfer_funds/bloc/transfer_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferFundsBloc extends Bloc {
  TransferFundsUseCase _useCase;

  final transferFundsViewModelPipe = Pipe<TransferFundsViewModel>();
  final fromAccountPipe = Pipe<String>();
  final toAccountPipe = Pipe<String>();
  final amountPipe = Pipe<String>();
  final datePipe = Pipe<DateTime>();
  //final submitPipe = Pipe<void>();

  TransferFundsBloc() {
    _useCase = TransferFundsUseCase(
            (viewModel) => transferFundsViewModelPipe.send(viewModel));
    transferFundsViewModelPipe.onListen(() => _useCase.create());
    fromAccountPipe.receive.listen(fromAccountInputHandler);
    toAccountPipe.receive.listen(toAccountInputHandler);
    amountPipe.receive.listen(amountPipeHandler);
    datePipe.receive.listen(dateHandler);
    // idPipe.receive.listen(idHandler);
  }

  void fromAccountInputHandler(String fromAccount) {
    _useCase.updateFromAccount(fromAccount);
  }

  void toAccountInputHandler(String toAccount) {
    _useCase.updateToAccount(toAccount);
  }

  void amountPipeHandler(String amount) {
    _useCase.updateAmount(amount);
  }

  void dateHandler(DateTime date) {
    _useCase.updateDate(date);
  }

  // void idHandler() {
  //   _useCase.updateId();
  // }

  @override
  void dispose() {
    transferFundsViewModelPipe.dispose();
    fromAccountPipe.dispose();
    toAccountPipe.dispose();
    amountPipe.dispose();
    datePipe.dispose();
    // idPipe.dispose();
  }
}