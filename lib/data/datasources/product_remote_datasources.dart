// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter_agribisnisku/data/models/responses/add_target_response_model.dart';
import 'package:flutter_agribisnisku/data/models/responses/product_target_response_model.dart';

import '../../core/constants/variabels.dart';
import 'package:http/http.dart' as http;

import '../models/requests/add_target_request_model.dart';

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
  Future<Either<String, AddTargetResponseModel>> addTarget(
      AddTargetRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/product-targets'),
      body: data.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return Right(AddTargetResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }

  Future<AddTargetResponseModel> deleteTarget(int id) async {
    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/product-targets/$id'),
    );
    if (response.statusCode == 200) {
      return AddTargetResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<AddTargetResponseModel> editTask(
      int id, AddTargetRequestModel data) async {
    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/product-targets/$id'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddTargetResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
