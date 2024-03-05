part of 'product_target_bloc.dart';

@freezed
class ProductTargetEvent with _$ProductTargetEvent {
  const factory ProductTargetEvent.started() = _Started;
  const factory ProductTargetEvent.getAll() = _GetAll;
}
