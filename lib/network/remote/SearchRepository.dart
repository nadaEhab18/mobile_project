import 'package:dio/dio.dart';

class SearchRepository {
  final Dio _dio = Dio();

  Future<Response> searchResult(String national_id) async {
    final response = await _dio.post(
        'http://localhost:4000/student/searchStudent',
        data: {
          "national_id": national_id

        }
    );
    print(response);
    return response;
  }
}