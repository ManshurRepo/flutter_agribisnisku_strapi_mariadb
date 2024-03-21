part of 'business_profile_bloc.dart';

@freezed
class BusinessProfileState with _$BusinessProfileState {
  const factory BusinessProfileState.initial() = _Initial;
  const factory BusinessProfileState.loading() = _Loading;
  const factory BusinessProfileState.loaded(BusinessProfileResponseModel model) = _Loaded;
  const factory BusinessProfileState.error(String message) = _Error;
}
