import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsPostServiceRequestModel extends JsonRequestModel {
  final String startDate;
  final String endDate;

  AccountStatementsPostServiceRequestModel({
    required this.startDate,
    required this.endDate,
  });

  @override
  Map<String, dynamic> toJson() => {
        'startDate': startDate,
        'endDate': endDate,
      };
}
