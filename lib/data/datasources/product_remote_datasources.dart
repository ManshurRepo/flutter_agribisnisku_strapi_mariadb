import 'package:dartz/dartz.dart';
import 'package:flutter_agribisnisku/data/models/responses/product_target_response_model.dart';

import '../../core/constants/variabels.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductTargetResponseModel>> getProductTarget() async {
    final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/product-targets?populate=*'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Right(ProductTargetResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
