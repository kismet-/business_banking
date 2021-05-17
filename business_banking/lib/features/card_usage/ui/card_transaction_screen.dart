import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_tile.dart';

import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CardTransactionScreen extends Screen {
  final CardSummaryViewModel viewModel;
  const CardTransactionScreen({
    @required this.viewModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText('Card Summary',
                  style: TextStyle(color: Colors.green.shade500, fontSize: 20.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: viewModel.transactionDetails.length,
                itemBuilder: (context, index) {
                  return CardTransactionTile(
                      viewModel: viewModel.transactionDetails[index]);
                },
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5.0,
                    color: Colors.white,
                    child: MaterialButton(
                      key: Key('transaction_bar_button'),
                      onPressed: () => CFRouterScope.of(context)
                          .push(BusinessBankingRouter.cardDetailsRoute),
                      child: Text(
                        'Card Summary',
                        style: TextStyle(color: Colors.green.shade500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}