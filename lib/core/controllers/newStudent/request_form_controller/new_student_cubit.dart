import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/models/NewStudent/new_student_model.dart';
import 'package:mobile_project/network/remote/constant.dart';


import '../../../../network/remote/cache_helper.dart';
import '../../../../network/remote/dio_file.dart';
import 'new_student_status.dart';

class NewStudentCubit extends Cubit<NewStudentStatus> {
  NewStudentCubit() : super(RequestNewtInitState());
  static NewStudentCubit get(context) => BlocProvider.of(context);

  int newFamilyOutInt = 0 ;

newStudent new_student = newStudent(familyAbroad:0 ,secondaryEducationAbroad: 0,
    housingWithoutCatering: 0 ,specialNeed: 0) ;

  Future<int?> submitNewStudent() async {
    emit(LoadingNewStudent());
    // try {
    Response? response = await DioHelperStore.postData(
        url: ApiConstants.requeestFormNewApi,
        data: new_student.toJson());
    if (response != null) {
      if (response.statusCode == 200) {
         await CacheHelper.saveData(key: "nationalId", value:new_student.nationalID ) ;
        log(CacheHelper.getData(key: "nationalId"));

      }
      log(response.statusMessage.toString());
      emit(DoneSubmitNewStudent());
      return response.statusCode ;
    } else {
      emit(ErrorSubmitNewStudent());
      return response!.statusCode ;

    }

  }
}
