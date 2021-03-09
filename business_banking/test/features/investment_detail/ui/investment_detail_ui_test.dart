import 'package:business_banking/features/investment/ui/investment_presenter.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:business_banking/features/investment_detail/model/stock_contribution_model.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_feature_widget.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/investment_detail_bloc_mock.dart';

void main() {
  MaterialApp testWidget;
  InvestmentDetailBlockMock investmentDetailBlockMock;

  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<InvestmentDetailBlockMock>(
        create: (_) => InvestmentDetailBlockMock(),
        child: InvestmentDetailWidget(),
      ),
    );

    investmentDetailBlockMock = InvestmentDetailBlockMock();
  });

  group('Investment Detail Page', () {
    testWidgets('should shows the presenter', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(InvestmentDetailPresenter);
      expect(widgetType, findsOneWidget);
    });

    testWidgets('should shows list of contribution stock', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final Finder finder = find.byKey(Key('item-list-key'));
      expect(finder, findsWidgets);
    });

    testWidgets('should shows back button to navigate hub page',
        (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final finder = find.byKey(Key('investment-detail-backButton'));
      expect(finder, findsWidgets);
    });

    testWidgets('should show Account Balance at top of screen', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final Finder finder = find.text('Account Balance');
      expect(finder, findsWidgets);
    });

    // testWidgets('should show table header at top of stock list',
    //     (tester) async {
    //   // pumpWidget calls runApp, and also triggers a frame to paint the app.
    //   await tester.pumpWidget(testWidget);
    //   //pump trigger a rebuild since the data-loading process will happen post-runApp.
    //   await tester.pump(Duration(milliseconds: 1500));

    //   final finder = find.byKey(Key('detail-list-header'));
    //   expect(finder, findsWidgets);
    // });

    // testWidgets('should show table header at top of stock list',
    //     (tester) async {
    //   await tester.pumpWidget(testWidget);
    //   //pump trigger a rebuild since the data-loading process will happen post-runApp.
    //   await tester.pump(Duration(milliseconds: 5500));
    //   await tester.pumpAndSettle();

    //   var mockInvestments =
    //       investmentDetailBlockMock.investmentDetailViewModelSample.investments;
    //   // pumpWidget calls runApp, and also triggers a frame to paint the app.

    //   for (var car in mockInvestments) {
    //     final carTitleFinder = find.text(' ');
    //     //await tester.ensureVisible(carTitleFinder);
    //     expect(carTitleFinder, findsOneWidget);
    //   }
    // });
  });
}
