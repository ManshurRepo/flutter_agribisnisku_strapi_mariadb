import 'package:bloc/bloc.dart';
import 'package:flutter_agribisnisku/data/datasources/business_remote_datasource.dart';
import 'package:flutter_agribisnisku/data/models/responses/business_target_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_target_event.dart';
part 'business_target_state.dart';
part 'business_target_bloc.freezed.dart';

class BusinessTargetBloc extends Bloc<BusinessTargetEvent, BusinessTargetState> {
  BusinessTargetBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await BusinessRemoteDataSource().getBusinessTarget();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
