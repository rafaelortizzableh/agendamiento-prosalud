import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

typedef FormSumbissionsRecord = ({
  int sheetsResultStatusCode,
  int emailResultStatusCode
});

class FormService {
  FormService(this._dio);

  final Dio _dio;
  static const String _urlEmailServerlessFunction =
      String.fromEnvironment('EMAIL_API_URL');

  static const String _urlSheetsServerlessFunction =
      String.fromEnvironment('SHEETS_API_URL');

  Future<FormSumbissionsRecord> submitForm({
    required Map<String, dynamic> data,
  }) async {
    try {
      final responses = await Future.wait([
        _dio.post(_urlSheetsServerlessFunction, data: data),
        _dio.post(_urlEmailServerlessFunction, data: data),
      ]);

      return (
        sheetsResultStatusCode: responses.first.statusCode ?? 400,
        emailResultStatusCode: responses.last.statusCode ?? 400,
      );
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw 'Lo sentimos, algo salió mal. Por favor, inténtalo de nuevo.';
    }
  }

  Map<String, dynamic> processData({
    required String name,
    required TypeOfId typeOfId,
    required String idNumber,
    required int age,
    required String diagnosis,
    required Therapy typeOfTherapy,
    required String address,
    InsuranceCompany? insuranceCompany,
    required int telephone,
    Department? department,
    Locality? locality,
    required int numberOfSessions,
    required DateTime authDate,
    required Schedule preferedSchedule,
  }) {
    try {
      Map<String, dynamic> data = {
        'name': name,
        'typeOfDoc': typeOfId.type,
        'idNumber': idNumber,
        'age': age.toString(),
        'address': address,
        'telephone': telephone.toString(),
        'department': department?.name ?? '',
        'locality': locality?.name ?? '',
        'diagnosis': diagnosis,
        'typeOfTherapy': typeOfTherapy.therapyName,
        'numberOfSessions': numberOfSessions.toString(),
        'preferedSchedule': preferedSchedule.time,
        'authDate': '${authDate.day}-${authDate.month}-${authDate.year}',
        'insuranceCompany': insuranceCompany?.name ?? '',
      };

      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
