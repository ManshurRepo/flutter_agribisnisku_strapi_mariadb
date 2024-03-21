import 'package:bloc/bloc.dart';
import 'package:flutter_agribisnisku/data/datasources/business_profile_remote_datasource.dart';
import 'package:flutter_agribisnisku/data/models/responses/business_profile_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_profile_event.dart';
part 'business_profile_state.dart';
part 'business_profile_bloc.freezed.dart';

class BusinessProfileBloc
    extends Bloc<BusinessProfileEvent, BusinessProfileState> {
  BusinessProfileBloc() : super(const _Initial()) {
    on<_GetProfile>((event, emit) async {
      emit(const _Loading());
      final response = await BusinessProfileDatasoursce().getProfile();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
