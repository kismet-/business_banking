import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashDetailsPresenter extends Presenter<SideCashDetailsBloc,
    SideCashDetailsViewModel, SideCashDetailsScreen> {
  final toggleDetailsFunc;
  SideCashDetailsPresenter({this.toggleDetailsFunc});

  @override
  Stream<SideCashDetailsViewModel> getViewModelStream(
      SideCashDetailsBloc bloc) {
    return bloc.viewModelPipe.receive;
  }

  @override
  SideCashDetailsScreen buildScreen(BuildContext context,
      SideCashDetailsBloc bloc, SideCashDetailsViewModel viewModel) {
    return SideCashDetailsScreen(
      viewModel: viewModel,
      toggleDetails: toggleDetailsFunc ?? toggleDetails,
      bloc: bloc,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future toggleDetails(SideCashDetailsBloc bloc, bool isOpen) async {
    bloc.toggleDetails.send(isOpen);
  }
}
