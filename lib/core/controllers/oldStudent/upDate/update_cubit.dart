import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/oldStudent/upDate/update_status.dart';
import 'package:mobile_project/network/remote/constant.dart';
import '../../../../models/NewStudent/new_student_model.dart';
import '../../../../network/remote/dio_file.dart';
class UpdateCubit extends Cubit<UpdateStatus> {
  UpdateCubit() : super(UpdateOldSInitState());

  static UpdateCubit get(context) => BlocProvider.of(context);

  newStudent? studentModelUpdate = newStudent(secondaryEducationAbroad: 1);
  String? errorMessage;

  changedGovernrate(selectedGovernorate) {
    if (selectedGovernorate != null) {
      emit(governrateChaged());
    }
    return selectedGovernorate;
  }
  changedColage(selectedCollage) {
    if (selectedCollage != null) {
      emit(CollageChanged());
    }
    return selectedCollage;
  }

  Future choseFunction(bool isOld)async {
    if (isOld == true) {
        emit(LoadingUpdateOldStudent());
        try {
          Response? response = await DioHelperStore.putData(
            url: ApiConstants.updatOldStudentData,
            data: studentModelUpdate!.toJson(),
          );

          if (response.statusCode == 200) {
            log(response.statusMessage.toString());
            log(studentModelUpdate!.name!);
            emit(saveUpdatedData());
            return response.statusCode;

          }
        } catch (error) {
          log("Failed to submit: $error");
          log(error.toString());
          errorMessage = error.toString();
          log(errorMessage!);
          return 404;

        }
      }
    else {

        emit(LoadingUpdateOldStudent());

          Response? response = await DioHelperStore.putData(
            url: ApiConstants.updateNewStudentData,
            data: studentModelUpdate!.toJson(),
          );

          if (response.statusCode == 200) {
            log(response.statusMessage.toString());
            return response.statusCode;
          }else{

            log(response.statusCode.toString());
            log(response.statusMessage.toString());
            return 404;


        }
      }
    }

}


