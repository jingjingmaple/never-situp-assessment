import 'dart:convert';

import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:http/http.dart' as http;
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';
import 'package:never_situp_assessment/config/API.dart';

Future<List<DepartmentModel>> getDepartments() async {
  final response = await http.get(Uri.parse('${APIConfig.serviceURL}/api/v1/departments'));
  if (response.statusCode == 200) {
    final List<dynamic> json = jsonDecode(response.body);
    return json.map((item) => DepartmentModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch department data');
  }
}

Future<List<ProductModel>> getProduct(String departmentId) async {
  final response = await http.get(Uri.parse('${APIConfig.serviceURL}/api/v1/departments/${departmentId}/products'));
  if (response.statusCode == 200) {
    final List<dynamic> json = jsonDecode(response.body);
    return json.map((item) => ProductModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch product data');
  }
}