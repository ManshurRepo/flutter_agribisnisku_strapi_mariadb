import 'package:dartz/dartz.dart';
import 'package:flutter_agribisnisku/data/models/responses/business_target_response_model.dart';

import '../../core/constants/variabels.dart';
import 'package:http/http.dart' as http;

class BusinessRemoteDataSource {
  Future<Either<String, BusinessTargetResponseModel>> getBusinessTarget() async {
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/business-targets?populate=*'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Right(BusinessTargetResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
