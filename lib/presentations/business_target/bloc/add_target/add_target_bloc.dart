// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_agribisnisku/data/datasources/business_remote_datasource.dart';
import 'package:flutter_agribisnisku/data/models/requests/add_target_request_model.dart';
import 'package:flutter_agribisnisku/data/models/responses/add_target_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'add_target_bloc.freezed.dart';
part 'add_target_event.dart';
part 'add_target_state.dart';

class AddBusinessTargetBloc extends Bloc<AddTargetEvent, AddTargetState> {
  final BusinessRemoteDataSource dataSource;
  AddBusinessTargetBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_AddBusinessTarget>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.addTarget(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
        );
    });
  }
}
