part of 'business_target_bloc.dart';

@freezed
class BusinessTargetEvent with _$BusinessTargetEvent {
  const factory BusinessTargetEvent.started() = _Started;
  const factory BusinessTargetEvent.getAll() = _GetAll;

}
