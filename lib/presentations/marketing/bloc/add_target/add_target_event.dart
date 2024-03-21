part of 'add_target_bloc.dart';

@freezed
class AddTargetEvent with _$AddTargetEvent {
  const factory AddTargetEvent.started() = _Started;
  const factory AddTargetEvent.addMarketingTarget(AddTargetRequestModel model) = _AddMarketingTarget;
}
