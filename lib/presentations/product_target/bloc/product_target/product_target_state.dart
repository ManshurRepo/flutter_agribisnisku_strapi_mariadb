part of 'product_target_bloc.dart';

@freezed
class ProductTargetState with _$ProductTargetState {
  const factory ProductTargetState.initial() = _Initial;
  const factory ProductTargetState.loading() = _Loading;
  const factory ProductTargetState.loaded(ProductTargetResponseModel model) = _Loaded;
  const factory ProductTargetState.error(String message) = _Error;
}
