part of 'business_target_bloc.dart';

@freezed
class BusinessTargetState with _$BusinessTargetState {
  const factory BusinessTargetState.initial() = _Initial;
  const factory BusinessTargetState.loading() = _Loading;
  const factory BusinessTargetState.loaded(BusinessTargetResponseModel model) = _Loaded;
  const factory BusinessTargetState.error(String message) = _Error;
}
