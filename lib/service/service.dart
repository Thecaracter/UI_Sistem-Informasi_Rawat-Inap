import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // Nonaktifkan verifikasi sertifikat SSL
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> fetchHospitalData() async {
    String hospitalApiUrl =
        'https://dekontaminasi.com/api/id/covid19/hospitals';

    try {
      Response response = await dio.get(hospitalApiUrl);

      if (response.statusCode == 200) {
        // Parse the response data as a JSON string
        String responseBody = response.data;
        dynamic jsonData = jsonDecode(responseBody);

        // API call successful, return the parsed data
        return jsonData;
      } else {
        // API call failed, throw an exception with the status code
        throw Exception(
            'Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Throw an exception with the error message
      throw Exception('Error: $error');
    }
  }

  Future<dynamic> fetchProvincesData() async {
    String provincesApiUrl =
        'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json';

    try {
      Response response = await dio.get(provincesApiUrl);

      if (response.statusCode == 200) {
        // Parse the response data as a JSON string
        dynamic jsonData = response.data;

        // API call successful, return the parsed data
        return jsonData;
      } else {
        // API call failed, throw an exception with the status code
        throw Exception(
            'Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Throw an exception with the error message
      throw Exception('Error: $error');
    }
  }
}
