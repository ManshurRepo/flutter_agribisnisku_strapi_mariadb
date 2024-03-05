import 'package:bloc/bloc.dart';
import 'package:flutter_agribisnisku/data/datasources/marketing_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/models/responses/marketing_target_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketing_target_event.dart';
part 'marketing_target_state.dart';
part 'marketing_target_bloc.freezed.dart';

class MarketingTargetBloc
    extends Bloc<MarketingTargetEvent, MarketingTargetState> {
  MarketingTargetBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await MarketingRemoteDataSource().getTarget();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
