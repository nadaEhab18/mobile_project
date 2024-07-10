import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/network/remote/cache_helper.dart';
import 'package:mobile_project/network/remote/constant.dart';


import '../../../../models/OldStudent/old_student_model.dart';
import '../../../../network/remote/dio_file.dart';
import 'old_student_status.dart';


class OldStudentCubit extends Cubit<OldStudentStatus>{
  OldStudentCubit() : super(RequestFormStInitState());
  static OldStudentCubit get(context) => BlocProvider.of(context);

  StudentModel studentModel = StudentModel(familyAbroad: 0 ,housingWithoutCatering: 0,specialNeed: 0 );

  String? errorMessage ;
int familyOutValue = 0 ;
  Future<int?> submitOldStudent() async {
  emit(LoadingOldStudent());

    Response? response = await DioHelperStore.postData(
        url: ApiConstants.requestFormOldApi,
        data: studentModel.toJson()
    );
    if (response?.statusCode == 200) {
        CacheHelper.saveData(key: "nationalId", value:  studentModel.nationalID ) ;
      log(CacheHelper.getData(key: "nationalId"));
      return response!.statusCode ;
    }else{
      return response!.statusCode ;
    }

}}


