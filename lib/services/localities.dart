import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../models/models.dart';

class LocalityRequestService {
  LocalityRequestService(this._dio);

  final Dio _dio;
  Future<List<Locality>?> getLocalitiesFromDane(Department department) async {
    try {
      final response =
          await _dio.get('https://www.datos.gov.co/resource/xdk5-pm3f.json');
      String departmentId = department.id.toString();
      List<dynamic> responseData = response.data;
      List<Locality> allLocalities =
          responseData.map((map) => Locality.fromDaneMap(map)).toList();
      List<Locality> definiteList = allLocalities
          .where((element) => element.departmentId.startsWith(departmentId))
          .toList();

      return definiteList;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<List<Locality>?> getLocalitiesFromLocalJson(
      Department department) async {
    try {
      String jsonLocalitiesfile =
          await rootBundle.loadString('assets/json/localities.json');
      List<Map<String, dynamic>> jsonLocalitiesList =
          jsonDecode(jsonLocalitiesfile);
      List<Locality> allLocalities =
          jsonLocalitiesList.map((map) => Locality.fromDaneMap(map)).toList();
      String departmentId = department.id.toString();
      List<Locality> definiteList = allLocalities
          .where((element) =>
              element.departmentId.toString().startsWith(departmentId))
          .toList();
      return definiteList;
    } catch (e) {
      print(e);
    }
  }
}
