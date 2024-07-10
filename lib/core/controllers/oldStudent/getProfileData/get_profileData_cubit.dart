
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/oldStudent/upDate/update_cubit.dart';
import 'package:mobile_project/models/NewStudent/get_new_student_model.dart';
import 'package:mobile_project/network/remote/constant.dart';
import '../../../../network/remote/dio_file.dart';
import 'GetProfileStatus.dart';
class GetProfileCubit extends Cubit<GetProfileStatus> {
  GetProfileCubit() : super(GetProInitState());

  static GetProfileCubit get(BuildContext context) =>
      BlocProvider.of<GetProfileCubit>(context);

  StudentData? newStudents;

  bool? gpa;
  bool? UpdateProfile ;

  Future<int?> GetStudentData(context) async {
    emit(LoadingNewDataProfile());
    try {
      Response? response = await DioHelperStore.getData(
        url: ApiConstants.getStudentData,
      );

        // Decode JSON response directly to a Map<String, dynamic>
        final Map<String ,dynamic> responseData = response.data;
        // Create Students object using fromJson factory method
        if (response.statusCode == 200) {
        newStudents = StudentData.fromJson(responseData);
          emit(DoneGetNewDataProfile(newStudents!));
        log(newStudents!.student.name);
        log("GpaId ${newStudents!.student.gpaId.toString()}");
        UpdateCubit.get(context).studentModelUpdate!.name = GetProfileCubit.get(context).newStudents!.student.name;
        UpdateCubit.get(context).studentModelUpdate!.email = GetProfileCubit.get(context).newStudents!.student.email;
        UpdateCubit.get(context).studentModelUpdate!.eygptian = GetProfileCubit.get(context).newStudents!.student.eygptian;
        UpdateCubit.get(context).studentModelUpdate!.nationalID = GetProfileCubit.get(context).newStudents!.student.nationalID;
        UpdateCubit.get(context).studentModelUpdate!.studentCode = GetProfileCubit.get(context).newStudents!.student.studentCode;
        UpdateCubit.get(context).studentModelUpdate!.birthDate = GetProfileCubit.get(context).newStudents!.student.birthDate;
        UpdateCubit.get(context).studentModelUpdate!.gender = GetProfileCubit.get(context).newStudents!.student.gender;
        UpdateCubit.get(context).studentModelUpdate!.religion = GetProfileCubit.get(context).newStudents!.student.religion;
        UpdateCubit.get(context).studentModelUpdate!.phoneNumber = GetProfileCubit.get(context).newStudents!.student.phoneNumber;
        UpdateCubit.get(context).studentModelUpdate!.mobileNumber = GetProfileCubit.get(context).newStudents!.student.mobileNumber;
        UpdateCubit.get(context).studentModelUpdate!.fatherName = GetProfileCubit.get(context).newStudents!.student.fatherName;
        UpdateCubit.get(context).studentModelUpdate!.fatherNationalID = GetProfileCubit.get(context).newStudents!.student.fatherNationalID;
        UpdateCubit.get(context).studentModelUpdate!.fatherOccupation = GetProfileCubit.get(context).newStudents!.student.fatherOccupation;
        UpdateCubit.get(context).studentModelUpdate!.fatherphone = GetProfileCubit.get(context).newStudents!.student.fatherPhone;
        UpdateCubit.get(context).studentModelUpdate!.guardianNationalID = GetProfileCubit.get(context).newStudents!.student.guardianNationalID;
        UpdateCubit.get(context).studentModelUpdate!.parentsStatus = GetProfileCubit.get(context).newStudents!.student.parentsStatus;
        UpdateCubit.get(context).studentModelUpdate!.guardianPhoneNumber = GetProfileCubit.get(context).newStudents!.student.guardianPhoneNumber;
        UpdateCubit.get(context).studentModelUpdate!.guardianRelation = GetProfileCubit.get(context).newStudents!.student.guardianRelation;
        UpdateCubit.get(context).studentModelUpdate!.guardianName = GetProfileCubit.get(context).newStudents!.student.guardianName;
        UpdateCubit.get(context).studentModelUpdate!.housingType = GetProfileCubit.get(context).newStudents!.student.housingType;
        UpdateCubit.get(context).studentModelUpdate!.successRate = GetProfileCubit.get(context).newStudents!.student.successRate;
        UpdateCubit.get(context).studentModelUpdate!.housingWithoutCatering = GetProfileCubit.get(context).newStudents!.student.housingWithoutCatering;
        UpdateCubit.get(context).studentModelUpdate!.HousingPreviousYear = GetProfileCubit.get(context).newStudents!.student.housingInPreviousYear;
        UpdateCubit.get(context).studentModelUpdate!.familyAbroad = GetProfileCubit.get(context).newStudents!.student.familyAbroad;
        UpdateCubit.get(context).studentModelUpdate!.specialNeed = GetProfileCubit.get(context).newStudents!.student.specialNeed;
        UpdateCubit.get(context).studentModelUpdate!.password = GetProfileCubit.get(context).newStudents!.student.password;
        UpdateCubit.get(context).studentModelUpdate!.confirmPassword = GetProfileCubit.get(context).newStudents!.student.confirmPassword;
        UpdateCubit.get(context).studentModelUpdate!.collegeId = GetProfileCubit.get(context).newStudents!.student.collegeId;
        UpdateCubit.get(context).studentModelUpdate!.Department = GetProfileCubit.get(context).newStudents!.student.department;
        UpdateCubit.get(context).studentModelUpdate!.levelId = GetProfileCubit.get(context).newStudents!.student.levelId;
        UpdateCubit.get(context).studentModelUpdate!.gpa_id = GetProfileCubit.get(context).newStudents!.student.gpaId;
        UpdateCubit.get(context).studentModelUpdate!.governorateId =GetProfileCubit.get(context).newStudents!.student.governorateId;
        UpdateCubit.get(context).studentModelUpdate!.cityId= GetProfileCubit.get(context).newStudents!.student.cityId;
        UpdateCubit.get(context).studentModelUpdate!.address = GetProfileCubit.get(context).newStudents!.student.address;
            if (newStudents!.student.gpaId != null) {
           gpa = true;
           log("gpa = $gpa}");
         } else {
           gpa = false;
           log("gpa = $gpa}");
               UpdateCubit.get(context).studentModelUpdate!.secondaryEducationTotalScore = GetProfileCubit.get(context).newStudents!.student.SecondaryEducationTotalScore;
               UpdateCubit.get(context).studentModelUpdate!.secondaryEducationRate =GetProfileCubit.get(context).newStudents!.student.SecondaryEducationRate;
               UpdateCubit.get(context).studentModelUpdate!.secondaryEducationAbroad = GetProfileCubit.get(context).newStudents!.student.SecondaryEducationAbroad;
               UpdateCubit.get(context).studentModelUpdate!.secondaryEducationDivision = GetProfileCubit.get(context).newStudents!.student.SecondaryEducationDivision;
            }
       }
      return response.statusCode;
    } catch (err) {
      log(err.toString());
      emit(ErrorGetNewDataProfile());
      return 404;

    }
  }


}
