part of 'marketing_target_bloc.dart';

@freezed
class MarketingTargetState with _$MarketingTargetState {
  const factory MarketingTargetState.initial() = _Initial;
  const factory MarketingTargetState.loading() = _Loading;
  const factory MarketingTargetState.loaded(MarketingTargetResponseModel model) = _Loaded;
  const factory MarketingTargetState.error(String message) = _Error;
}
