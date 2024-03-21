part of 'business_profile_bloc.dart';

@freezed
class BusinessProfileEvent with _$BusinessProfileEvent {
  const factory BusinessProfileEvent.started() = _Started;
  const factory BusinessProfileEvent.getProfile() = _GetProfile;
}
