
import 'package:flutter/material.dart';

import '../../core/controllers/newStudent/request_form_controller/new_student_cubit.dart';
import '../../widgets/customSwitch.dart';
import '../../widgets/customTextFormField.dart';


class ParentNewStudent extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const ParentNewStudent({Key? key, required this.formKey}) : super(key: key);

  @override
  State<ParentNewStudent> createState() => _ParentNewStudentState();
}

class _ParentNewStudentState extends State<ParentNewStudent> {

  String? newDropParent;
  bool newFamilyOut = false ;



  TextEditingController newFatherNationalIdController = TextEditingController();
  TextEditingController newParentNationalIdController = TextEditingController();
  TextEditingController newFatherNameController = TextEditingController();
  TextEditingController newParentNameController = TextEditingController();
  TextEditingController newFatherMobileController = TextEditingController();
  TextEditingController newParentMobileController = TextEditingController();
  TextEditingController newFatherJobController = TextEditingController();
  TextEditingController newParentRelationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                    prefixIcon: Icon(Icons.person),
                    controller: newFatherNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم رباعى ';
                      }
                      if (value.length < 12) {
                        return 'الرجاء إدخال الاسم رباعى كامل';
                      }
                      return null;
                    }, showInput: (){
                      print('newFatherName : ${newFatherNameController.text}');
                    },
                    onChanged: (p0){
                      NewStudentCubit.get(context).new_student.fatherName  = p0 ;
                    },
                  ),

                  /// الرقم القومى للاب
                  CustomTextFormField(label: 'الرقم القومى للأب',
                    typeKeyBoard: TextInputType.number,
                    prefixIcon: Icon(Icons.perm_contact_cal_rounded),
                    controller: newFatherNationalIdController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الرقم القومي';
                      }
                      if (value.length != 14) {
                        return 'الرجاء إدخال الرقم القومي كامل';
                      }
                      return null;
                    },onChanged: (p0){
                      NewStudentCubit.get(context).new_student.fatherNationalID  = p0 ;
                    },

                    showInput: (){
                      print('newFatherNationalId : ${newFatherNationalIdController.text}');
                    },
                  ),

                  /// وظيفة الاب
                  CustomTextFormField(label: 'وظيفة الاب',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: Icon(Icons.work),
                    controller: newFatherJobController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال وظيفة الاب ';
                      }
                      if (value.length < 5) {
                        return 'الرجاء إدخال وظيفة الاب';
                      }
                      return null;
                    },
                    onChanged: (p0){
                      NewStudentCubit.get(context).new_student.fatherOccupation = p0 ;
                    },

                    showInput: (){
                      print('newFatherJob : ${newFatherJobController.text}');
                    },
                  ),

                  /// تليفون الاب
                  CustomTextFormField(label: 'تليفون الاب',
                    typeKeyBoard: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    controller: newFatherMobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال تليفون الاب ';
                      }
                      if (!value.contains('01')) {
                        return 'الرجاء إدخال تليفون الاب صح';
                      }
                      if (value.length != 11) {
                        return 'الرجاء إدخال تليفون الاب';
                      }
                      return null;
                    },
                    onChanged: (p0){
                      NewStudentCubit.get(context).new_student.fatherphone = p0 ;
                    },

                    showInput: (){
                      print('newFatherMobile : ${newFatherMobileController.text}');
                    },
                  ),

                  /// اسم ولى الامر
                  CustomTextFormField(label: 'اسم ولى الامر',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: Icon(Icons.person),
                    controller: newParentNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم رباعى ';
                      }
                      if (value.length < 12) {
                        return 'الرجاء إدخال الاسم رباعى كامل';
                      }
                      return null;
                    },onChanged: (p0){
                      NewStudentCubit.get(context).new_student.guardianName = p0 ;
                    },

                    showInput: (){
                      print('newParentName : ${newParentNameController.text}');
                    },
                  ),

                  /// الرقم القومى لولي الأمر
                  CustomTextFormField(label: 'الرقم القومى لولي الأمر',
                    typeKeyBoard: TextInputType.number,
                    prefixIcon: Icon(Icons.perm_contact_cal_rounded),
                    controller: newParentNationalIdController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الرقم القومي';
                      }
                      if (value.length != 14) {
                        return 'الرجاء إدخال الرقم القومي كامل';
                      }
                      return null;
                    },onChanged: (p0){
                      NewStudentCubit.get(context).new_student.guardianNationalID  = p0 ;
                    },

                    showInput: (){
                      print('newParentNationalId : ${newParentNationalIdController.text}');
                    },
                  ),

                  /// تليفون ولي الأمر
                  CustomTextFormField(label: 'تليفون ولي الأمر',
                    typeKeyBoard: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    controller: newParentMobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال تليفون ولي الأمر ';
                      }
                      if (!value.contains('01')) {
                        return 'الرجاء إدخال تليفون ولي الأمر صح';
                      }
                      if (value.length != 11) {
                        return 'الرجاء إدخال تليفون ولي الأمر';
                      }
                      return null;
                    },
                    onChanged: (p0){
                      NewStudentCubit.get(context).new_student.guardianPhoneNumber  = p0 ;
                    },

                    showInput: (){
                      print('newParentMobile : ${newParentMobileController.text}');
                    },
                  ),

                  /// صلة ولى الامر
                  CustomTextFormField(label: 'صلة ولى الامر',
                    typeKeyBoard: TextInputType.text,
                    prefixIcon: Icon(Icons.person_search_rounded),
                    controller: newParentRelationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال صلة ولى الامر';
                      }
                      if (value.length < 2) {
                        return 'الرجاء إدخال صلة ولى الامر كامل';
                      }
                      return null;
                    },
                    onChanged: (p0){
                      NewStudentCubit.get(context).new_student.guardianRelation = p0 ;
                    },

                    showInput: (){
                      print('newParentRelation : ${newParentRelationController.text}');
                    },
                  ),

                  /// حالة تخص الوالدين
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        label:Text('حالة تخص الوالدين'),
                        prefixIcon: Icon(Icons.people_alt),
                        border: InputBorder.none,
                      ),
                      // hint:Text('حالة تخص الوالدين'),
                      validator: (value) {
                        if (value == null || (value as String).isEmpty) {
                          return 'الرجاء اختيار حالة تخص الوالدين';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          newDropParent = val as String;
                            NewStudentCubit.get(context).new_student.parentsStatus  = newDropParent ;
                          print('parentState : $newDropParent');
                        });
                      },
                      value: newDropParent,
                      items: <DropdownMenuItem<String>>[
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
                    switchValue: newFamilyOut,
                    changeFunction: (newValue ) {
                      setState(() {
                        newFamilyOut = newValue;
                        NewStudentCubit.get(context).newFamilyOutInt =1 ;
                          NewStudentCubit.get(context).new_student.familyAbroad = NewStudentCubit.get(context).newFamilyOutInt ;

                        print('family out : $newFamilyOut');
                      });
                    },
                  ),


                ],
              ),
            ),
          ]
      ),
    )
    ;
  }
}
