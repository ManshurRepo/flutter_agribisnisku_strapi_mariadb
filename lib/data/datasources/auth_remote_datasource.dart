// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';

import '../../core/constants/variabels.dart';
import '../models/requests/login_request_model.dart';
import '../models/responses/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel data) async {
    final response =
    await http.post(Uri.parse('${Variables.baseUrl}/api/auth/local'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data.toJson(),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Right(LoginResponseModel.fromJson(response.body));
    } else {
      return const Left('Login Gagal');
    }
  }
}
