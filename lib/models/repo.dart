import 'package:dio/dio.dart';
import 'package:mobile_project/models/resultModel.dart';

class StudentRepository {
  final _dio = Dio();

  Future<dynamic> showStudentResult(String nationalId) async {
    final Response res = await _dio.post('http://127.0.0.1:4000/student/searchStudent',
        data: {
          "national_id":nationalId
        }
    );
    final StudentResultModel data = StudentResultModel.fromJson(res.data);
    print(res.data);
    return data;
  }









}




// {result: [{name: هدى محمد, national_id: 23456789532452, college_name: كلية الهندسة بحلوان }], message:  4 تم قبولك فى مبنى }


// {result: [{name: tddd, nationalID: 54673825467785, college_name: كلية التجارة}], message: لم يتم مراجعة بياناتك بعد }

// "54673825467899",
// " 4 تم قبولك فى مبنى "


// 87654367455,  message: استبعاد النطاق