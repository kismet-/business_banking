import 'package:business_banking/features/account_statements/model/account_statements/account_statements_view_model.dart';
import 'package:business_banking/features/account_statements/ui/account_statements/account_statements_screen_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _disabledAlphaColor = 0x80;

class AccountStatementsScreen extends Screen {
  final AccountStatementsViewModel viewModel;
  final AccountStatementsPresenterActions actions;

  AccountStatementsScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) =>
      _Screen(viewModel: viewModel, actions: actions);
}

class _Screen extends StatefulWidget {
  final AccountStatementsViewModel viewModel;
  final AccountStatementsPresenterActions actions;

  const _Screen({
    Key? key,
    required this.viewModel,
    required this.actions,
  }) : super(key: key);

  @override
  __ScreenState createState() => __ScreenState();
}

class __ScreenState extends State<_Screen> {
  late final _formKey;
  late final _goalEditCtrl;
  late final _deadlineEditCtrl;
  late final _focusNode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _deadlineEditCtrl.dispose();
    _goalEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: Text(
          'Statements',
          key: Key('AccountStatements-appbar-title'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                _buildFromInput(context),
                SizedBox(
                  height: 10,
                ),
                _buildToInput(context),
                _SubmitButton(
                  formKey: _formKey,
                  actions: widget.actions,
                  isEnabled: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFromInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              child: Text(
                'From Date:',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              key: Key('AccountStatements-textedit'),
              controller: TextEditingController(),
              cursorColor: Colors.green,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                prefixIcon: Icon(Icons.calendar_today_sharp),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              // RegEx for date in mm/dd/yyyy format
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'/^\d{2}\/\d{2}\/\d{4}$/ ')),
              ],
              onFieldSubmitted: (String date) {},
              onSaved: (String? date) {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildToInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              child: Text(
                'To Date:',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              key: Key('AccountStatements-textedit'),
              controller: TextEditingController(),
              cursorColor: Colors.green,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                prefixIcon: Icon(Icons.calendar_today_sharp),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'/^\d{2}\/\d{2}\/\d{4}$/')),
              ],
              onFieldSubmitted: (String) {},
              onSaved: (String? date) {},
            ),
          )
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
    required this.formKey,
    required this.actions,
    required this.isEnabled,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final AccountStatementsPresenterActions actions;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          key: Key('AccountStatements-submit-button'),
          child: Text(
            'Submit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green.withAlpha(
                isEnabled ? 0xFF : _disabledAlphaColor,
              ),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
                final alpha = states.contains(MaterialState.disabled)
                    ? _disabledAlphaColor
                    : 0xFF;

                return BorderSide(
                  width: 2,
                  color: Colors.green.withAlpha(alpha),
                );
              },
            ),
          ),
          onPressed: isEnabled
              ? () {
                  if (formKey.currentState != null) {
                    formKey.currentState!.save();
                  }
                }
              : null,
        ),
      ),
    );
  }
}
