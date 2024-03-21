import 'package:flutter_agribisnisku/data/models/responses/business_profile_response_model.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../core/constants/variabels.dart';

class BusinessProfileDatasoursce {
  Future<Either<String, BusinessProfileResponseModel>> getProfile() async {
    final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/business-profiles?populate=*'));

    if (response.statusCode == 200) {
      return Right(BusinessProfileResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
