

import 'package:bloc/bloc.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' ;
import 'package:mobile_project/core/controllers/others/studentResult/studentResStatus.dart';
import 'package:mobile_project/models/resultModel.dart';
import 'package:mobile_project/network/remote/constant.dart';


import '../../../../network/remote/dio_file.dart';

class StudentResCubit extends Cubit<StudentResStatus> {
  StudentResCubit() : super(studentResInitState());

  static StudentResCubit get(BuildContext context) =>
      BlocProvider.of<StudentResCubit>(context);


  bool _showDataTable = false;

  StudentResultModel? data;

 Future<void> showResult({required  email}) async{

    try {
      Response? response = await DioHelperStore.postData(
        url: ApiConstants.searchRrsult,
        data: {"national_id" : email}
      );
       data = StudentResultModel.fromJson(response!.data);
      _showDataTable = true;
      if (response.statusCode == 200) {
        print(data?.result[0].name);
        emit(GetResultSuccess());
      } else {
        print(response.statusMessage.toString());
      }
    } catch (error) {
      print(error.toString());
    }
 }
}

//   Future<void> showResult({required email}) async {
//     try {
//       // Set a higher receive timeout value
//       Options options = Options(receiveTimeout:  ); // 15 seconds timeout
//
//       Response? response = await DioHelperStore.postData(
//         url: ApiConstants.searchRrsult,
//         data: {"nationalID": email},
//         options: options, // Pass the options to set timeout
//       );
//
//       resultDataModel = StudentResultModel.fromJson(response!.data);
//       _showDataTable = true;
//
//       if (response.statusCode == 200) {
//         print(resultDataModel!.result![0].name);
//       } else {
//         print(resultDataModel);
//       }
//     } catch (error) {
//       print(error.toString());
//     }
//   }
// }