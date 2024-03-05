import 'package:flutter_agribisnisku/data/models/requests/add_marketing_target_request_model.dart';
import 'package:flutter_agribisnisku/data/models/responses/marketing_target_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variabels.dart';

class MarketingRemoteDataSource {
  Future<Either<String, MarketingTargetResponseModel>> getTarget() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/marketing-targets?populate=*'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Right(MarketingTargetResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, MarketingTargetResponseModel>> addTarget(AddMarketingTargetRequestModel data) async {
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/marketing-targets'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Right(MarketingTargetResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }

}
