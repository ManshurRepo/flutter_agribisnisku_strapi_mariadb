import 'package:dartz/dartz.dart';

import '../../core/constants/variabels.dart';
import '../models/requests/login_request_model.dart';
import '../models/responses/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(LoginResponseModel.fromJson(response.body));
    } else {
      return left('Login Gagal');
    }
  }
}
