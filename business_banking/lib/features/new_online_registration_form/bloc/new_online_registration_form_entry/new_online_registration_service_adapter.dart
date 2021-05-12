import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_request_model.dart';
import 'package:business_banking/features/new_online_registration_form/api/new_online_registration_service_response_model.dart';
import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class NewOnlineRegistrationRequestServiceAdapter extends ServiceAdapter<
    NewOnlineRegistrationEntity,
    NewOnlineRegistrationServiceRequestModel,
    NewOnlineRegistrationServiceResponseModel,
    NewOnlineRegistrationService> {
  NewOnlineRegistrationRequestServiceAdapter()
      : super(NewOnlineRegistrationService());

  @override
  NewOnlineRegistrationEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      errors: <EntityFailure>[],
      accountNumberGenerated: responseModel.accountNumberGenerated,
    ) as NewOnlineRegistrationEntity;
  }

  @override
  NewOnlineRegistrationServiceRequestModel createRequest(
      NewOnlineRegistrationEntity entity) {
    return NewOnlineRegistrationServiceRequestModel(
      cardHolderName: entity.cardHolderName,
      cardNumber: entity.cardNumber,
      email: entity.email,
      userPassword: entity.userPassword,
    );
  }
}
