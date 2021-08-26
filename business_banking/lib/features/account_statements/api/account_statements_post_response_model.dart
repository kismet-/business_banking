import 'package:clean_framework/clean_framework_defaults.dart';

class AccountStatementsPostServiceResponseModel extends JsonResponseModel {
  final bool didSucceed;
  final String status;

  AccountStatementsPostServiceResponseModel.fromJson(
    Map<String, dynamic> json,
  )   : didSucceed = json['didSucceed'] ?? false,
        status = json['status'] ?? '';

  @override
  List<Object?> get props => [didSucceed, status];
}
