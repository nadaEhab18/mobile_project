import 'package:flutter/material.dart';
import '../../core/controllers/oldStudent/request_form_controller/old_student_cubit.dart';
import '../../core/controllers/oldStudent/request_form_controller/old_student_status.dart';
import '../../widgets/customSwitch.dart';
import '../../widgets/customTextFormField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ParentInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const  ParentInfo({Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  State<ParentInfo> createState() => _ParentInfoState();
}

class _ParentInfoState extends State<ParentInfo> {
  String? parentStatus;
  bool familyOut = false;/// switch
  int? familyOutValue ;



  TextEditingController fatherNationalIdController = TextEditingController();
  TextEditingController parentNationalIdController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController fatherMobileController = TextEditingController();
  TextEditingController parentMobileController = TextEditingController();
  TextEditingController fatherJobController = TextEditingController();
  TextEditingController parentRelationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OldStudentCubit , OldStudentStatus>(listener: (contxt , state){} ,
      builder: (context , state) {
        OldStudentCubit.get(context);
      return SingleChildScrollView(
        child:
        Stack(
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 120),
              child: Image.asset('assets/images/helwanLogoo.png',
                // height: 400,
              ),
            ),
            Form(
            key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [

                  /// اسم الأب
                  CustomTextFormField(label: 'اسم الأب',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: const Icon(Icons.person),
                    controller: fatherNameController,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال الاسم رباعى ';
                      }
                      if (value.length < 12) {
                        return  'الرجاء إدخال الاسم رباعى كامل';
                      }
                      return    null;

                    },
                    onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.fatherName = p0 ; 
                      },
                  ),

                  /// الرقم القومى للاب
                  CustomTextFormField(label: 'الرقم القومى للأب',
                    typeKeyBoard: TextInputType.number,
                    prefixIcon: const Icon(Icons.perm_contact_cal_rounded),
                    controller: fatherNationalIdController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال الرقم القومي';
                      }
                      if (value.length != 14) {
                        return   'الرجاء إدخال الرقم القومي كامل';
                      }
                      return   null;
                    },
                    onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.fatherNationalID = p0 ; 
                      },
                  ),

                  /// وظيفة الاب
                  CustomTextFormField(label: 'وظيفة الاب',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: const Icon(Icons.work),
                    controller: fatherJobController,
                      validator: (value){
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال وظيفة الاب ';
                      }
                      if (value.length < 5) {
                        return   'الرجاء إدخال وظيفة الاب';
                      }
                      return  null;
                    },
                      onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.fatherOccupation = p0 ; 
                      },
                  ),

                  /// تليفون الاب
                  CustomTextFormField(label: 'تليفون الاب',
                    typeKeyBoard: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                    controller: fatherMobileController,
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                          return  'الرجاء إدخال تليفون الاب ';
                      }
                      if (!value.contains('01')) {
                        return   'الرجاء إدخال تليفون الاب صح';
                      }
                      if (value.length != 11) {
                        return   'الرجاء إدخال تليفون الاب';
                      }
                      return   null;
                    },
                      onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.fatherphone = p0 ;
                      },
                  ),

                  /// اسم ولى الامر
                  CustomTextFormField(label: 'اسم ولى الامر',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: const Icon(Icons.person),
                    controller: parentNameController,
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال الاسم رباعى ';
                      }
                      if (value.length < 12) {
                        return   'الرجاء إدخال الاسم رباعى كامل';
                      }
                      return   null;
                      },
                      onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.guardianName = p0 ; 
                      },
                  ),

                  /// الرقم القومى لولي الأمر
                  CustomTextFormField(label: 'الرقم القومى لولي الأمر',
                    typeKeyBoard: TextInputType.number,
                    prefixIcon: const Icon(Icons.perm_contact_cal_rounded),
                    controller: parentNationalIdController,
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال الرقم القومي';
                      }
                      if (value.length != 14) {
                        return   'الرجاء إدخال الرقم القومي كامل';
                      }
                      return   null;
                      },
                      onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.guardianNationalID = p0 ; 
                      },
                  ),

                  /// تليفون ولي الأمر
                  CustomTextFormField(label: 'تليفون ولي الأمر',
                    typeKeyBoard: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                    controller: parentMobileController,
                      validator: (value){
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال تليفون ولي الأمر ';
                      }
                      if (!value.contains('01')) {
                        return   'الرجاء إدخال تليفون ولي الأمر صح';
                      }
                      if (value.length != 11) {
                        return   'الرجاء إدخال تليفون ولي الأمر';
                      }
                      return   null;
                    },
                    onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.guardianPhoneNumber = p0 ; 
                      },
                  ),

                  /// صلة ولى الامر
                  CustomTextFormField(label: 'صلة ولى الامر',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: const Icon(Icons.person_search_rounded),
                    controller: parentRelationController,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return   'الرجاء إدخال صلة ولى الامر';
                      }
                      if (value.length < 2) {
                        return   'الرجاء إدخال صلة ولى الامر كامل';
                      }
                      return   null;
                    },
                      onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.guardianRelation = p0 ; 
                      },
                  ),

                  /// حالة تخص الوالدين
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        label:Text('حالة تخص الوالدين'),
                        prefixIcon: Icon(Icons.people_alt),
                        border: InputBorder.none,
                      ),
                     // hint:Text('حالة تخص الوالدين'),
                      onChanged: (val) {
                        setState(() {
                          parentStatus = val as String;
                      OldStudentCubit.get(context).studentModel.parentsStatus = val ; 
                          print('parentState :  $parentStatus');
                        });
                      },
                      validator: (value) {
                        if (value == null || (value as String).isEmpty) {
                          return 'الرجاء اختيار حالة تخص الوالدين';
                        }
                        return null;
                      },
                      value: parentStatus,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          child: Text('على قيد الحياة'),
                          value: 'Alive',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('انفصال الوالدين'),
                          value: 'Parental Separation',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('وفاة الوالدين'),
                          value: 'Parents Death',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('وفاة الوالد'),
                          value: 'Father Death',
                        ),
                      ],

                    ),
                  ),

                  /// الاسرة بالخارج
                  CustomSwitch(
                    switchTitle: 'الاسرة بالخارج',
                    switchValue: familyOut,
                    changeFunction: (newValue ) {
                      setState(() {
                        familyOut = newValue;
                        OldStudentCubit.get(context).familyOutValue = 1;
                        OldStudentCubit.get(context).studentModel.familyAbroad =  OldStudentCubit.get(context).familyOutValue ;

                      });
                    },
                      
                  ),



                          ],
              ),
            ),
          ]
        ),
      );
    });
    
    
    }



}


  





