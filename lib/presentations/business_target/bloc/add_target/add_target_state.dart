part of 'add_target_bloc.dart';

@freezed
class AddTargetState with _$AddTargetState {
  const factory AddTargetState.initial() = _Initial;
  const factory AddTargetState.loading() = _Loading;
  const factory AddTargetState.loaded(AddTargetResponseModel model) = _Loaded;
  const factory AddTargetState.error(String message) = _Error;
}
