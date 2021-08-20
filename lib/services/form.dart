import 'package:dio/dio.dart';
import '../models/models.dart';

enum SubmitSheetsOrEmailFunction { email, sheets }

class FormService {
  FormService(this._dio);

  final Dio _dio;
  static const String _urlEmailServerlessFunction =
      'https://enzf2gdm7c0p9io.m.pipedream.net';

  static const String _urlSheetsServerlessFunction =
      'https://en1lc94w82bp4f1.m.pipedream.net';

  Future<int> submitForm(
      {required Map<String, dynamic> data,
      required SubmitSheetsOrEmailFunction type}) async {
    try {
      String _url = type == SubmitSheetsOrEmailFunction.email
          ? _urlEmailServerlessFunction
          : _urlSheetsServerlessFunction;
      Response response = await _dio.post(_url, data: data);
      return response.statusCode ?? 400;
    } on DioError catch (e) {
      print(e);
      throw e;
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
    required InsuranceCompany insuranceCompany,
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
      };

      return data;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
