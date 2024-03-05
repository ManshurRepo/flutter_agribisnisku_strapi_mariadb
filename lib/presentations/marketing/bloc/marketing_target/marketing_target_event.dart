part of 'marketing_target_bloc.dart';

@freezed
class MarketingTargetEvent with _$MarketingTargetEvent {
  const factory MarketingTargetEvent.started() = _Started;
  const factory MarketingTargetEvent.getAll() = _GetAll;
}
