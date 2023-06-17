import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio();

  Future<dynamic> fetchHospitalData() async {
    String apiUrl = 'https://dekontaminasi.com/api/id/covid19/hospitals';

    try {
      Response response = await dio.get(apiUrl);

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
}
