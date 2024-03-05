import 'package:bloc/bloc.dart';
import 'package:flutter_agribisnisku/data/datasources/product_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/models/responses/product_target_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_target_event.dart';
part 'product_target_state.dart';
part 'product_target_bloc.freezed.dart';

class ProductTargetBloc extends Bloc<ProductTargetEvent, ProductTargetState> {
  ProductTargetBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await ProductRemoteDataSource().getProductTarget();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
