import 'package:business_banking/features/card_usage/enums.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTransactionTile extends StatelessWidget {
  final CardSummaryModel viewModel;
  const CardTransactionTile({Key key, @required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionCategory category = EnumToString.fromString(
        TransactionCategory.values, viewModel.transactionCategory)!;
    return Card(
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Container(
                //   color: category.color,
                //   height: 20,
                //   width: 3,
                //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                // ),
                Text(viewModel.transactionTitle),
              ],
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + viewModel.transactionAmount.toStringAsFixed(2),
                  style: TextStyle(
                      color: viewModel.debit ? Colors.red : Colors.green),
                ),
                Text(DateFormat('MM/dd/yyyy').format(viewModel.date))
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child:
                Text(EnumToString.convertToString(category, camelCase: true)),
          ),
        ));
  }
}
