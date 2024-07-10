
import 'package:mobile_project/network/remote/cache_helper.dart';

String baseUrl = 'http://127.0.0.1:4000/student' ;

 String nationalId = CacheHelper.getData(key:"nationalId");


class ApiConstants {

  static String requestFormOldApi = '$baseUrl/addrequestoldstudent';
  static String requeestFormNewApi = '$baseUrl/addrequestnewstudent';
  static String loginApi = '$baseUrl/login' ;
  static String updatOldStudentData = '$baseUrl/updateoldstudent/$nationalId';
  static String updateNewStudentData = '$baseUrl/updatenewstudent/$nationalId';
  static String searchRrsult = '$baseUrl/searchStudent';

  static String getStudentData = '$baseUrl/get_student1/$nationalId';
}










