import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/screens/home.dart';
import 'package:mobile_project/screens/requestConforim.dart';
import '../core/controllers/oldStudent/getProfileData/GetProfileStatus.dart';
import '../core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import '../core/controllers/oldStudent/request_form_controller/old_student_cubit.dart';
import '../core/controllers/oldStudent/request_form_controller/old_student_status.dart';

import 'old student/facultyInfo.dart';
import 'old student/parentInfo.dart';
import 'old student/studentInfo.dart';
import 'others/profile.dart';
import 'others/updateProfile.dart';


class RequestStepper extends StatefulWidget {
  const RequestStepper({Key? key}) : super(key: key);

  @override
  State<RequestStepper> createState() => _RequestStepperState();
}

class _RequestStepperState extends State<RequestStepper> {


  int currentStep = 0;
  bool isCompleted = false;
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();

  GlobalKey<FormState> _getCurrentFormKey() {
    switch (currentStep) {
      case 0:
        return formKey1;
      case 1:
        return formKey2;
      case 2:
        return formKey3;
      case 3:
        return formKey4;
      default:
        throw Exception('Invalid step index');

    }
  }
  List<Step> getSteps() =>
      [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Icon(Icons.recent_actors_rounded),
          // Text('الطالب',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          content: StudentInfo(
            formKey: formKey1,
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Icon(Icons.family_restroom_outlined),
          //     Text('ولى الامر',overflow: TextOverflow.ellipsis,
          // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          content: ParentInfo(
            formKey: formKey2,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Icon(Icons.maps_home_work_rounded),
          // Text('تفاصيل',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          content: FacultyInfo(
            formKey: formKey3,
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Icon(Icons.fact_check_rounded),
          // Text('تأكيد',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          content: RequestConfirm(
            formKey: formKey4,
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OldStudentCubit , OldStudentStatus>(listener: (contxt , state){
    } , builder: (context , state){
      return
      BlocConsumer<GetProfileCubit , GetProfileStatus>( listener: (context , state){} ,builder: (context , state){ return Scaffold(
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff093c71),
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stepper(
              type: StepperType.horizontal,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                if (_getCurrentFormKey().currentState!.validate()) {
                  setState(() {
                    if(currentStep == 3){
                      getErrorMessage(context);
                      currentStep = 0 ;
                    }
                    else if(currentStep < 3 ){
                      currentStep += 1; }
                  },
                  );
                }
              },

              onStepCancel: currentStep == 0
                  ? null
                  : () => setState(() {
                currentStep > 0 ? currentStep -= 1 : currentStep = 0;
              }),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = currentStep == getSteps().length - 1;
                return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              isLastStep == 3 ? 'Cnforim' : 'التالى',
                            ),
                            onPressed:details.onStepContinue
                          // details.onStepContinue,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      if (currentStep != 0)
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffac8600),
                            ),
                            child: Text(
                              'السابق',
                            ),
                            onPressed: details.onStepCancel,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );});});




  }}
getErrorMessage(context )async {
  final res = await OldStudentCubit.get(context).submitOldStudent();
  if (res == 200) {
    final rese = await GetProfileCubit.get(context).GetStudentData(context);
    if (rese != null) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  Home()));
    }
  } else if (res == 404) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            "الرجاء التاكد من اسم المستخدم و الباسورد مطابقين للرقم القومى "),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );
  }
  else if (res == 400) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("هذا الحساب موجود لدينا بالفعل ..."),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ));
  }
}
