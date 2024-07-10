
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/screens/others/profile.dart';
import '../../core/controllers/oldStudent/getProfileData/GetProfileStatus.dart';
import '../../core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import '../../core/controllers/oldStudent/upDate/update_cubit.dart';
import '../../core/controllers/oldStudent/upDate/update_status.dart';

import '../../widgets/customTextFormField.dart';
import '../go.dart';

class UpdateStudentProfile extends StatefulWidget {
  const UpdateStudentProfile({Key? key}) : super(key: key);


  @override
  State<UpdateStudentProfile> createState() => _UpdateStudentProfileState();
}
var formKey = GlobalKey<FormState>();

class _UpdateStudentProfileState extends State<UpdateStudentProfile> {
  TextEditingController birthdateController = TextEditingController();
  TextEditingController newPercentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscureText = true;
  String? newValuee;

  String? egyption;

  String? religion;

  String? dropParent;
  String? abroad;

  String? housingBefore;

  String? housingType;

  String withOutFood = "بتغذية";
  String? speacialNeed;

  int? selectedLevel;

  String? dropCollage;
  int? selectedCollage;

  List<String> collages = [
    "كلية الهندسة بحلوان ",
    "كلية التجارة",
    "كلية الهندسة بالمطرية",
    "كلية الفنون الجميلة",
    "كلية الحاسبات و المعلومات ",
    "كلية السياحة و الفنادق",
    "كلية الفنون التطبيقية",
    "كلية التكنولوجيا و التعليم الصناعى",
    "كلية الاقتصاد المنزلى",
    "كلية التربية الفنية",
    "كلية التربية الموسيقية",
    "كلية التربية الرياضية (بنين)",
    "كلية التربية الرياضية (بنات)",
    "كلية الحقوق",
    "كلية الاداب",
    "كلية التربية",
    "كلية الخدمة الاجتماعية",
    "كلية الصيدلة",
    "كلية العلوم ",
    "كلية التمريض",
    "كلية الطب",
    "المعهد القومى للملكية الفكرية",
    "معهد التمريض ",
    "كلية الحاسبات و المعلومات"
  ];
  String? dropGovernorate;

  List<String> governorates = [
    "القاهرة", //1
    "الجيزة", //2
    "الاسكندرية", //3
    "الدقهلية", //4
    "البحر الاحمر", //5
    "البحيرة", //6
    "الفيوم", //7
    "الغربية", //8
    "الاسماعلية", //9
    "المنوفية", //10
    "المنيا", //11
    "القليوبية", //12
    "الوادى الجديد", //13
    "السويس", //14
    "اسوان", //15
    "اسيوط", //16
    "بنى سويف", //17
    "بورسعيد", //18
    "دمياط", //19
    "الشرقية", //20
    "جنوب سيناء", //21
    "كفرالشيخ", //22
    "مطروح", //23
    "الاقصر", //24
    "قنا", //25
    "شمال سيناء", //26
    "سوهاج", //27


  ];
  String egyptcountery = "مصر";
  int? selectedCity;

  String? parentStatus;
  String? newDropScorePerson;
  bool studyOut = false;
  int studyOutInt = 0;
  int? dropScorePerson;

  bool gpaExist = false;

  List<String> personScore = [
    "مقبول",
    "محمل بمواد",
    "غياب بعذر",
    "منقول بمادة و مادة ثانوية",
    "ناجح",
    "جيد",
    "جيد جدا",
    "ممتاز",
    "منقول بمادتين و مادة فرعية",
    "راسب",
    "دور تانى",
    "منقطع"
  ];


  List<Map<String, dynamic>> getLevels(int collageId) {
    return levels.firstWhere((element) =>
    element['collage_id'] == collageId)['collage_levels'];
  }


  String? selectedValue;

  int? egypt;

  String? name;

  String? nationalId;

  String? studentCode;

  String? birthDate;

  String? adress;

  String? phone;

  String? mobile;

  String? fatherName;

  String? fatherNation;

  String? fatherPhon;

  String? guarName;

  String? guarNation;

  String? guaPhone;

  String? guaRela;

  String? email;

  String? department;
  String? succes;

  bool changeedGovernrateId = false;
  bool changedCollageId = false;
  int?outFood;

  bool?speacialNeedUp;
  int? selectedID;

  int? selectedGovernorate;
  bool isOld = false;
  TextEditingController resultController = TextEditingController();

  List<Map<String, dynamic>> getCities(int governorateId) {
    return city.firstWhere((element) =>
    element['governorate_id'] == governorateId)['cities'];
  }

  Future<void> _selectDate() async {
    DateTime? _picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );

    if (_picker != null) {
      setState(() {
        birthdateController.text = _picker.toString().split(' ')[0];
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetProfileStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          GetProfileCubit getProfileCubit = GetProfileCubit.get(context);
          return BlocConsumer<UpdateCubit, UpdateStatus>(
              listener: (context, state) {},
              builder: (context, state) {
                UpdateCubit().studentModelUpdate?.parentsStatus =
                    getProfileCubit.newStudents!.student.parentsStatus;
                UpdateCubit
                    .get(context)
                    .studentModelUpdate!
                    .cityId = getProfileCubit.newStudents!.student.cityId;

                return Scaffold(
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Color(0xffac8600),
                    ),
                    backgroundColor:Color(0xff003c70),
                    centerTitle: true,
                    title: const Text(
                      'البروفايل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xffac8600),
                      ),
                    ),
                  ),
                  body: BlocListener<UpdateCubit, UpdateStatus>(
                    listener: (context, state) {
                      if (state is governrateChaged) {
                        setState(() {
                          selectedGovernorate != null;
                        });
                      }
                      if (state is CollageChanged) {
                        setState(() {
                          selectedCollage != null;
                        });
                      }
                    },
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Expanded(flex: 9,
                            child: SingleChildScrollView(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('بيانات الطالب/ة',
                                      style: TextStyle(color: Color(0xffac8600),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),

                                    const SizedBox(height: 10,),

                                    ///الجنسية
                                    Container(
                                        height: 60,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: DropdownButtonFormField<String>(
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            label: const Text('الجنسية:',
                                              style: TextStyle(
                                                  color: Colors.grey),),
                                            prefixIcon: const Icon(
                                              Icons.how_to_reg,
                                              color: Colors.black,),
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey[500]!,
                                              ),
                                            ),
                                          ),
                                          value: getProfileCubit.newStudents!
                                              .student.eygptian.toString(),
                                          items: const <
                                              DropdownMenuItem<String>>[
                                            DropdownMenuItem<String>(
                                              value: '1',
                                              child: Text('مصري'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: '0',
                                              child: Text('وافد'),
                                            ),

                                          ],
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              egyption = newValue!;
                                              if (egyption == "1") {
                                                egypt = 1;
                                              } else {
                                                egypt = 0;
                                              }

                                              UpdateCubit
                                                  .get(context)
                                                  .studentModelUpdate
                                                  ?.eygptian = egypt;
                                            });
                                          },


                                        )),

                                    ///النوع
                                    Container(
                                      height: 60,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: DropdownButtonFormField<String>(
                                        dropdownColor: Colors.white,
                                        decoration: InputDecoration(
                                          label: const Text(' النوع:',
                                            style: TextStyle(
                                                color: Colors.grey),),
                                          prefixIcon: const Icon(
                                            Icons.how_to_reg,
                                            color: Colors.black,),
                                          border: InputBorder.none,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide(
                                              color: Colors.grey[500]!,
                                            ),
                                          ),
                                        ),
                                        value: getProfileCubit.newStudents!
                                            .student.gender,
                                        items: const <DropdownMenuItem<String>>[
                                          DropdownMenuItem<String>(
                                            child: Text('ذكر'),
                                            value: 'Male',
                                          ),
                                          DropdownMenuItem<String>(
                                            child: Text('أنثى'),
                                            value: 'Female',
                                          ),

                                        ],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .gender = newValue!;
                                          });
                                        },


                                      ),

                                    ),

                                    /// الاسم
                                    EditTextFiled(
                                      labelText: 'الاسم رباعى باللغة العربية',
                                      prefixIcon: const Icon(Icons.person),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.name,
                                      //getProfileCubit.newStudents!.student.name,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.name = value;
                                      },
                                      vaildate: (value) {
                                        if (value!.isEmpty) {
                                          return 'الرجاء إدخال الاسم رباعى ';
                                        }
                                        if (value.length < 10) {
                                          return 'الرجاء إدخال الاسم رباعى كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// الرقم القومى
                                    EditTextFiled(
                                      labelText: 'الرقم القومي',
                                      prefixIcon: const Icon(
                                          Icons.perm_contact_cal_rounded),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.nationalID,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.nationalID = value;
                                      },
                                      vaildate: (value) {
                                        if (value!.isEmpty) {
                                          return 'الرجاء إدخال الرقم القومي';
                                        }
                                        if (value.length != 14) {
                                          return 'الرجاء إدخال الرقم القومي كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// كود الطالب
                                    EditTextFiled(
                                      labelText: 'كود الطالب',
                                      prefixIcon: const Icon(Icons.co_present),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.studentCode,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.studentCode = value;
                                      },
                                      vaildate: (value) {
                                        if (value!.isEmpty) {
                                          return 'الرجاء إدخال كود الطالب';
                                        }
                                        if (value.length != 11) {
                                          return 'الرجاء إدخال كود الطالب كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// تاريخ الميلاد

                                    CustomTextFormField(
                                      label: 'تاريخ الميلاد',
                                      controller: birthdateController,
                                      prefixIcon: const Icon(Icons.calendar_month_rounded),
                                      initialValue: getProfileCubit.newStudents!.student.birthDate,
                                      onChanged: (value) {
                                         setState(() {
                                           _selectDate();
                                         });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'الرجاء إدخال تاريخ الميلاد';
                                        }
                                        return null;
                                      },

                                    ),


                                    ///الديانه
                                    Container(
                                        height: 60,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: DropdownButtonFormField<String>(
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                            label: const Text('الديانة:',
                                              style: TextStyle(
                                                  color: Colors.grey),),
                                            prefixIcon: const Icon(
                                              Icons.how_to_reg,
                                              color: Colors.black,),
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey[500]!,
                                              ),
                                            ),
                                          ),
                                          value: getProfileCubit.newStudents!
                                              .student.religion,
                                          items: const <
                                              DropdownMenuItem<String>>[
                                            DropdownMenuItem<String>(
                                              value: 'muslim',
                                              child: Text('مسلم'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'christian',
                                              child: Text('مسيحي'),
                                            ),

                                          ],
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              UpdateCubit
                                                  .get(context)
                                                  .studentModelUpdate
                                                  ?.religion = newValue!;
                                            });
                                          },


                                        )),

                                    /// المحافظة
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: DropdownButtonFormField<int>(
                                        decoration: const InputDecoration(
                                          label: Text('المحافظة'),
                                          prefixIcon: Icon(Icons.yard),
                                          border: InputBorder.none,
                                        ),
                                        value: getProfileCubit.newStudents!
                                            .student.governorateId,
                                        items: governorates // string
                                            .asMap()
                                            .map((index, value) {
                                          int governorateValue = index + 1;
                                          return MapEntry(
                                            index,
                                            DropdownMenuItem<int>(
                                              value: governorateValue,
                                              child: Text(value),
                                            ),
                                          );
                                        })
                                            .values
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() {
                                            // UpdateOldSCubit.get(context).changeGovernrate(val, context) ;
                                            selectedID = val;
                                            UpdateCubit.get(context)
                                                .changedGovernrate(val);
                                            selectedGovernorate = val;
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate
                                                ?.governorateId = val;
                                            selectedCity = null;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'الرجاء اختيار المحافظة';
                                          }
                                          return null;
                                        },

                                      ),
                                    ),
                                    selectedGovernorate != null ?

                                    /// المدينة
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              4),
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        child: BlocBuilder<
                                            UpdateCubit,
                                            UpdateStatus>(
                                            builder: (context, state) {
                                              return DropdownButtonFormField<
                                                  int>(
                                                  decoration: const InputDecoration(
                                                    label: Text('المدينة'),
                                                    prefixIcon: Icon(
                                                        Icons.location_city),
                                                    border: InputBorder.none,
                                                  ),
                                                  onChanged: (val) async {
                                                    setState(() {
                                                      selectedCity = val;
                                                      // OldStudentCubit.get(context).studentModel.cityId = val ;
                                                      print(
                                                          " city: $selectedCity");
                                                    });
                                                  },
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'الرجاء اختيار المدينة';
                                                    }
                                                    return null;
                                                  },
                                                  value: selectedCity,
                                                  items: getCities(
                                                      selectedGovernorate!)
                                                      .asMap()
                                                      .map((index, value) {
                                                    int cityValue = value['id'];
                                                    return MapEntry(
                                                      index,
                                                      DropdownMenuItem<int>(
                                                        value: cityValue,
                                                        child: Text(
                                                            value['name']),
                                                      ),
                                                    );
                                                  })
                                                      .values
                                                      .toList());
                                            })) :

                                    /// المدينة
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              4),
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        child: DropdownButtonFormField<int>(
                                          decoration: const InputDecoration(
                                            label: Text('المدينة'),
                                            prefixIcon: Icon(
                                                Icons.location_city),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (val) async {
                                            setState(() {
                                              selectedCity = val;
                                              // OldStudentCubit.get(context).studentModel.cityId = val ;
                                              print(" city: $selectedCity");
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'الرجاء اختيار المدينة';
                                            }
                                            return null;
                                          },
                                          value: getProfileCubit.newStudents!
                                              .student.cityId,
                                          items: getCities(
                                              getProfileCubit.newStudents!
                                                  .student.governorateId)
                                              .asMap()
                                              .map((index, value) {
                                            int cityValue = value['id'];
                                            return MapEntry(
                                              index,
                                              DropdownMenuItem<int>(
                                                value: cityValue,
                                                child: Text(value['name']),
                                              ),
                                            );
                                          })
                                              .values
                                              .toList(), // Show empty list when no governorate is selected.

                                        )),


                                    /// العنوان بالتفاصيل
                                    EditTextFiled(
                                      labelText: 'العنوان بالتفاصيل',
                                      prefixIcon: const Icon(
                                          Icons.account_balance),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.address,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.address = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال العنوان بالتفاصيل ';
                                        }
                                        if (value.length < 20) {
                                          return 'الرجاء إدخال العنوان بالتفاصيل كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// التلبفون
                                    EditTextFiled(
                                      labelText: 'التلبفون',
                                      prefixIcon: const Icon(
                                          Icons.phone_android_outlined),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.phoneNumber,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.phoneNumber = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال التلبفون ';
                                        }
                                        if (!value.contains('01')) {
                                          return 'الرجاء إدخال التلبفون صح';
                                        }
                                        if (value.length != 11) {
                                          return 'الرجاء إدخال التلبفون كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// الموبيل
                                    EditTextFiled(
                                      labelText: 'الموبيل',
                                      prefixIcon: const Icon(Icons.phone),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.mobileNumber,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.mobileNumber = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الموبيل';
                                        }
                                        if (!value.contains('0')) {
                                          return 'الرجاء إدخال الموبيل صح';
                                        }
                                        if (value.length != 11) {
                                          return 'الرجاء إدخال الموبيل كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',),
                                    const SizedBox(height: 30,),

                                    const Text('بيانات ولى الامر',
                                      style: TextStyle(color: Color(0xffac8600),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),

                                    const SizedBox(height: 10,),

                                    /// اسم الأب
                                    EditTextFiled(
                                      labelText: 'اسم الأب',
                                      prefixIcon: const Icon(Icons.person),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.fatherName,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.fatherName = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الاسم رباعى ';
                                        }
                                        if (value.length < 12) {
                                          return 'الرجاء إدخال الاسم رباعى كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// الرقم القومى للاب
                                    EditTextFiled(
                                      labelText: 'الرقم القومى للاب',
                                      prefixIcon: const Icon(
                                          Icons.perm_contact_cal_rounded),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.fatherNationalID,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.fatherNationalID = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الرقم القومي';
                                        }
                                        if (value.length != 14) {
                                          return 'الرجاء إدخال الرقم القومي كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// وظيفة الاب
                                    EditTextFiled(
                                      labelText: 'وظيفة الاب',
                                      prefixIcon: const Icon(Icons.work),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.fatherNationalID,
                                      change: (value) {
                                        // initialValue = value; // Update newName as the user types
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال وظيفة الاب ';
                                        }
                                        if (value.length < 5) {
                                          return 'الرجاء إدخال وظيفة الاب';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),


                                    /// تليفون الاب
                                    EditTextFiled(
                                      labelText: 'تليفون الاب',
                                      prefixIcon: const Icon(
                                          Icons.phone_android_outlined),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.fatherPhone,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.fatherphone = value;
                                      },
                                      vaildate: (value) {
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
                                      controller: '',
                                    ),


                                    /// اسم ولى الامر
                                    EditTextFiled(
                                      labelText: 'اسم ولى الامر',
                                      prefixIcon: const Icon(Icons.person),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.guardianName,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.guardianName = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الاسم رباعى ';
                                        }
                                        if (value.length < 12) {
                                          return 'الرجاء إدخال الاسم رباعى كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),


                                    /// الرقم القومى لولي الأمر
                                    EditTextFiled(
                                      labelText: 'الرقم القومى لولي الأمر',
                                      prefixIcon: const Icon(
                                          Icons.perm_contact_cal_rounded),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.guardianNationalID,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.guardianNationalID = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال الرقم القومي';
                                        }
                                        if (value.length != 14) {
                                          return 'الرجاء إدخال الرقم القومي كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),


                                    /// تليفون ولي الأمر
                                    EditTextFiled(
                                      labelText: 'تليفون ولي الأمر',
                                      prefixIcon: const Icon(
                                          Icons.phone_android_outlined),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.guardianPhoneNumber,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.guardianPhoneNumber = value;
                                      },
                                      vaildate: (value) {
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
                                      controller: '',
                                    ),


                                    /// صلة ولى الامر
                                    EditTextFiled(
                                      labelText: 'صلة ولى الامر',
                                      prefixIcon: const Icon(
                                          Icons.person_search_rounded),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.guardianRelation,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.guardianRelation = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال صلة ولى الامر';
                                        }
                                        if (value.length < 2) {
                                          return 'الرجاء إدخال صلة ولى الامر كامل';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    /// حالة تخص الوالدين
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          label: Text('حالة تخص الوالدين'),
                                          prefixIcon: Icon(Icons.people_alt),
                                          border: InputBorder.none,
                                        ),
                                        // hint:Text('حالة تخص الوالدين'),
                                        onChanged: (val) {
                                          setState(() {
                                            parentStatus = val as String;
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .parentsStatus = parentStatus;
                                            print(
                                                'parentState :  $parentStatus');
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null
                                            //  value.isEmpty
                                          ) {
                                            return 'الرجاء اختيار حالة تخص الوالدين';
                                          }
                                          return null;
                                        },
                                        value: getProfileCubit.newStudents!
                                            .student.parentsStatus,
                                        items: const <DropdownMenuItem<String>>[
                                          DropdownMenuItem<String>(
                                            value: 'Alive',
                                            child: Text('على قيد الحياة'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Parental Separation',
                                            child: Text('انفصال الوالدين'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Parents Death',
                                            child: Text('وفاة الوالدين'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Father Death',
                                            child: Text('وفاة الوالد'),
                                          ),
                                        ],

                                      ),
                                    ),


                                    /// الاسرة بالخارج
                                    EditDropDown(
                                      textLable: 'الاسرة بالخارج',
                                      prefixIcon: const Icon(Icons.pageview),
                                      label1: 'نعم',
                                      value1: 1,
                                      label2: 'لا',
                                      value2: 0,
                                      newValue: getProfileCubit.newStudents!
                                          .student.familyAbroad.toString(),
                                      changeDrop: (String? newValue) {
                                        setState(() {
                                          UpdateCubit
                                              .get(context)
                                              .studentModelUpdate
                                              ?.familyAbroad =
                                              int.parse(newValue!);
                                        });
                                      },
                                    ),


                                    /// البريد الالكترونى
                                    EditTextFiled(
                                      labelText: 'البريد الالكترونى',
                                      prefixIcon: const Icon(Icons.email),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.email,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.email = value;
                                      },
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال البريد الالكترونى ';
                                        }
                                        if (!value.contains('@')) {
                                          return 'الرجاء إدخال البريد الالكترونى صح';
                                        }
                                        if (value.length < 10) {
                                          return 'الرجاء إدخال البريد الالكترونى';
                                        }
                                        return null;
                                      },
                                      controller: '',
                                    ),

                                    const SizedBox(height: 30,),

                                    const Text('بيانات الكلية',
                                      style: TextStyle(color: Color(0xffac8600),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),

                                    const SizedBox(height: 10,),

                                    /// الكلية
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: DropdownButtonFormField<int>(
                                        decoration: const InputDecoration(
                                          label: Text('الكلية'),
                                          prefixIcon: Icon(Icons.yard),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (val) async {
                                          setState(() {
                                            selectedCollage = val;
                                            UpdateCubit.get(context)
                                                .changedColage(selectedCollage);
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .collegeId = selectedCollage;
                                            selectedLevel = null;
                                            print("Collage : $selectedCollage");
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'الرجاء اختيار الكلية';
                                          }
                                          return null;
                                        },
                                        value: getProfileCubit.newStudents!
                                            .student.collegeId,
                                        items: collages
                                            .asMap()
                                            .map((index, value) {
                                          int collageValue = index + 1;
                                          return MapEntry(
                                            index,
                                            DropdownMenuItem<int>(
                                              value: collageValue,
                                              child: Text(value),
                                            ),
                                          );
                                        })
                                            .values
                                            .toList(),
                                      ),
                                    ),
                                    selectedCollage != null ?

                                    ///الفرقة
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: DropdownButtonFormField<int>(
                                          decoration: const InputDecoration(
                                            label: Text('الفرقة'),
                                            prefixIcon: Icon(Icons.yard),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (val) async {
                                            setState(() {
                                              selectedLevel = val;
                                              UpdateCubit
                                                  .get(context)
                                                  .studentModelUpdate!
                                                  .levelId = selectedLevel;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'الرجاء اختيار الفرقة';
                                            }
                                            return null;
                                          },
                                          value: selectedLevel,
                                          items: getLevels(selectedCollage!)
                                              .asMap()
                                              .map((index, value) {
                                            int levelValue = value['id'];
                                            return MapEntry(
                                              index,
                                              DropdownMenuItem<int>(
                                                value: levelValue,
                                                child: Text(value['name']),
                                              ),
                                            );
                                          })
                                              .values
                                              .toList()

                                      ),
                                    ) :
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: DropdownButtonFormField<int>(
                                        decoration: const InputDecoration(
                                          label: Text('الفرقة'),
                                          prefixIcon: Icon(Icons.yard),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (val) async {
                                          setState(() {
                                            selectedLevel = val;
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .levelId = selectedLevel;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'الرجاء اختيار الفرقة';
                                          }
                                          return null;
                                        },
                                        value: getProfileCubit.newStudents!
                                            .student.levelId,
                                        items: getLevels(
                                            getProfileCubit.newStudents!.student
                                                .collegeId).asMap()
                                            .map((index, value) {
                                          int levelValue = value['id'];
                                          return MapEntry(
                                            index,
                                            DropdownMenuItem<int>(
                                              value: levelValue,
                                              child: Text(value['name']),
                                            ),
                                          );
                                        })
                                            .values
                                            .toList(),
                                      ),
                                    ),


                                    getProfileCubit.gpa! ?
                                    Container(
                                        child: BlocBuilder<
                                            GetProfileCubit,
                                            GetProfileStatus>(
                                            builder: (context, state) {
                                              return Column(
                                                children: [

                                                  /// القسم
                                                  EditTextFiled(

                                                    labelText: 'القسم (الشعبة)',
                                                    prefixIcon: const Icon(Icons
                                                        .add_business_rounded),
                                                    initialValue: getProfileCubit
                                                        .newStudents!.student
                                                        .department!,
                                                    change: (value) {
                                                      UpdateCubit
                                                          .get(context)
                                                          .studentModelUpdate
                                                          ?.Department = value;
                                                    },
                                                    vaildate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'الرجاء إدخال القسم (الشعبة) ';
                                                      }
                                                      if (value.length < 10) {
                                                        return 'الرجاء إدخال القسم (الشعبة)';
                                                      }
                                                      return null;
                                                    },
                                                    controller: '',
                                                  ),

                                                  /// تقدير العام الماضى
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 12),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1.5,
                                                        color: Colors.grey
                                                            .shade400,
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .circular(4),
                                                    ),
                                                    child: DropdownButtonFormField(
                                                      decoration: const InputDecoration(
                                                        label: Text(
                                                            'تقدير العام الماضى'),
                                                        prefixIcon: Icon(
                                                            Icons.bar_chart),
                                                        border: InputBorder
                                                            .none,
                                                      ),
                                                      //  hint:Text('تقدير العام الماضى'),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isOld = true;
                                                          dropScorePerson =
                                                          val as int;
                                                          UpdateCubit
                                                              .get(context)
                                                              .studentModelUpdate
                                                              ?.gpa_id =
                                                              dropScorePerson;
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return 'الرجاء اختيار تقدير العام الماضى';
                                                        }
                                                        return null;
                                                      },
                                                      value: getProfileCubit
                                                          .newStudents!.student
                                                          .gpaId,
                                                      items: personScore
                                                          .asMap()
                                                          .map((index, value) {
                                                        int personScoreValue = index +
                                                            1;
                                                        return MapEntry(
                                                          index,
                                                          DropdownMenuItem<int>(
                                                            value: personScoreValue,
                                                            child: Text(value),
                                                          ),
                                                        );
                                                      })
                                                          .values
                                                          .toList(),
                                                    ),
                                                  ),

                                                  /// نسبة المئوية/(gpa)
                                                  EditTextFiled(
                                                    labelText: 'نسبة المئوية/(gpa)',
                                                    prefixIcon: const Icon(
                                                        Icons.percent_outlined),
                                                    initialValue: getProfileCubit
                                                        .newStudents!.student
                                                        .successRate.toString(),
                                                    change: (value) {
                                                      UpdateCubit
                                                          .get(context)
                                                          .studentModelUpdate
                                                          ?.successRate =
                                                          int.parse(value);
                                                    },
                                                    vaildate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return '(gpa)/الرجاء إدخال نسبة المئوية';
                                                      }
                                                      if (value.length < 2) {
                                                        return 'الرجاء إدخال نسبة المئوية/(gpa)';
                                                      }
                                                      return null;
                                                    },
                                                    controller: '',
                                                  ),

                                                  /// السكن فى الاعوام السابقة
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(4),
                                                      border: Border.all(
                                                        width: 1.5,
                                                        color: Colors.grey
                                                            .shade400,
                                                      ),
                                                    ),
                                                    child: DropdownButtonFormField(
                                                      decoration: const InputDecoration(
                                                        label: Text(
                                                            'السكن فى الاعوام السابقة'),
                                                        prefixIcon: Icon(
                                                            Icons.people_alt),
                                                        border: InputBorder
                                                            .none,
                                                      ),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          UpdateCubit
                                                              .get(context)
                                                              .studentModelUpdate
                                                              ?.HousingPreviousYear =
                                                              val.toString();
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == null
                                                           // ||(value ).isEmpty
                                                        ) {
                                                          return 'الرجاء اختيار تاسكن في الاعوام السابقة';
                                                        }
                                                        return null;
                                                      },
                                                      value: getProfileCubit
                                                          .newStudents!.student
                                                          .housingInPreviousYear,
                                                      items: const <
                                                          DropdownMenuItem<
                                                              String>>[
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: 'Old',
                                                          child: Text("قديم"),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: "New",
                                                          child: Text("مستجد"),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: 'Interrupted',
                                                          child: Text("منقطع"),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            }))
                                        : Column(
                                      children: [

                                        /// شعبة الثانوية العامة
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 12),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Colors.grey.shade400,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                4),
                                          ),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                label: Text(
                                                  'شعبة الثانوية العامة',
                                                  textDirection: TextDirection
                                                      .rtl,
                                                ),
                                                prefixIcon: Icon(
                                                    Icons.bar_chart),
                                                border: InputBorder.none,
                                              ),
                                              //  hint:Text('شعبة الثانوية العامة'),
                                              onChanged: (val) {
                                                setState(() {
                                                  isOld = false;
                                                  newDropScorePerson =
                                                  val as String;
                                                  UpdateCubit
                                                      .get(context)
                                                      .studentModelUpdate!
                                                      .secondaryEducationDivision =
                                                      newDropScorePerson;
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null
                                                    //||
                                                    //(value).isEmpty
                                                ) {
                                                  return 'الرجاء اختيار شعبة الثانوية العامة';
                                                }
                                                return null;
                                              },
                                              value: getProfileCubit.newStudents!.student.SecondaryEducationDivision,
                                              items: <String>[
                                                "علمى علوم",
                                                "علمى رياضة",
                                                "أدبي",
                                                "أزهر علمى",
                                                "أزهر أدبي",
                                                "معاهد فنية ثلاث سنين",
                                                "معاهد فنية أربع سنين",
                                                "معاهد فنية خمس سنين",
                                                "دبلومات فنية",
                                                "شهادات معادلة",
                                                "مدارس للعلوم و التكنولوجيا STEM",
                                                "مدارس النيل للعلوم و التكنولوجيا",
                                                "تحويل ورقى",
                                              ].map<DropdownMenuItem<String>>((
                                                  String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),

                                        ///الثانوية العامة من الخارج
                                        EditDropDown(
                                          textLable: 'الثانوية العامة من الخارج',
                                          prefixIcon: const Icon(
                                              Icons.pageview),
                                          label1: 'نعم',
                                          value1: 1,
                                          label2: 'لا',
                                          value2: 0,
                                          newValue: getProfileCubit.newStudents!
                                              .student.SecondaryEducationAbroad
                                              .toString(),
                                          changeDrop: (String? newValue) {
                                            setState(() {
                                              UpdateCubit
                                                  .get(context)
                                                  .studentModelUpdate
                                                  ?.secondaryEducationAbroad =
                                                  int.parse(newValue!);
                                            });
                                          },
                                        ),

                                        /// مجموع الثانوية العامة
                                        EditTextFiled(
                                          labelText: 'مجموع الثانوية العامة',
                                          prefixIcon: const Icon(
                                              Icons.school_outlined),
                                          initialValue: getProfileCubit
                                              .newStudents!.student
                                              .SecondaryEducationTotalScore
                                              .toString(),
                                          vaildate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الرجاء إدخال مجموع الثانوية العامة ';
                                            }

                                            if (value.length < 3) {
                                              return 'الرجاء إدخال مجموع الثانوية العامة';
                                            }
                                            return null;
                                          },
                                          change: (p0) {
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .secondaryEducationTotalScore = int.parse(p0) ;
                                          },
                                          controller: '',

                                        ),

                                        /// نسبة الثانوية العامة
                                        EditTextFiled(
                                          labelText: 'نسبة المئوية',
                                          prefixIcon: const Icon(
                                              Icons.percent_outlined),
                                          vaildate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الرجاء إدخال نسبة الثانوية العامة';
                                            }
                                            if (value.length < 2) {
                                              return 'الرجاء إدخال نسبة الثانوية العامة';
                                            }
                                            return null;
                                          },
                                          change: (p0) {
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate!
                                                .secondaryEducationRate = int.parse(p0);
                                          },
                                          initialValue: getProfileCubit
                                              .newStudents!.student
                                              .SecondaryEducationRate
                                              .toString(),
                                          controller: '', //GetProfileCubit.get(context).newStudents!.newStudents![0].SecondaryEducationRate.toString(),


                                        )
                                      ],
                                    ),


                                    /// نوع السكن
                                    Container(
                                      height: 60,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: DropdownButtonFormField<String>(
                                        dropdownColor: Colors.white,
                                        decoration: InputDecoration(
                                          label: const Text('نوع السكن:',
                                            style: TextStyle(
                                                color: Colors.grey),),
                                          prefixIcon: const Icon(
                                            Icons.how_to_reg,
                                            color: Colors.black,),
                                          border: InputBorder.none,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide(
                                              color: Colors.grey[500]!,
                                            ),
                                          ),
                                        ),
                                        value: getProfileCubit.newStudents!
                                            .student.housingType,
                                        items: const <DropdownMenuItem<String>>[
                                          DropdownMenuItem<String>(
                                            value: 'nonspecial',
                                            child: Text('عادى'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'special',
                                            child: Text('مميز'),
                                          ),

                                        ],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            UpdateCubit
                                                .get(context)
                                                .studentModelUpdate
                                                ?.housingType = newValue!;
                                          });
                                        },


                                      ),
                                    ),

                                    /// سكن بدون بتغذية
                                    EditDropDown(
                                      textLable: 'سكن بدون بتغذية',
                                      prefixIcon: const Icon(Icons.pageview),
                                      label1: 'بتغذية',
                                      value1: 1,
                                      label2: 'بدون تغذية',
                                      value2: 0,
                                      newValue: getProfileCubit.newStudents!
                                          .student.housingWithoutCatering
                                          .toString(),
                                      changeDrop: (String? newValue) {
                                        setState(() {
                                          UpdateCubit
                                              .get(context)
                                              .studentModelUpdate
                                              ?.housingWithoutCatering =
                                              int.parse(newValue!);
                                        });
                                      },
                                    ),


                                    const SizedBox(height: 7,),

                                    /// ذوى الاختياجات الخاصة
                                    EditDropDown(
                                      textLable: 'ذوى الاختياجات الخاصة',
                                      prefixIcon: const Icon(Icons.pageview),
                                      label1: 'نعم',
                                      value1: 1,
                                      label2: 'لا',
                                      value2: 0,
                                      newValue: getProfileCubit.newStudents!
                                          .student.specialNeed.toString(),
                                      changeDrop: (String? newValue) {
                                        setState(() {
                                          speacialNeed = newValue!;
                                          if (speacialNeed == "1") {
                                            speacialNeedUp = true;
                                          } else {
                                            speacialNeedUp = false;
                                          }
                                          UpdateCubit
                                              .get(context)
                                              .studentModelUpdate!
                                              .specialNeed;
                                        });
                                      },
                                    ),


                                    /// كلمة المرور
                                    EditTextFiled(
                                      labelText: 'كلمة المرور',
                                      prefixIcon: const Icon(Icons.password),
                                      initialValue: getProfileCubit.newStudents!
                                          .student.password,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.password = value;
                                      },
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              isObscureText = !isObscureText;
                                            },
                                          );
                                        },
                                        icon: isObscureText
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال كلمة المرور';
                                        }
                                        if (value.length < 8) {
                                          return 'الرجاء إدخال كلمة المرور كامل';
                                        }
                                        return null;
                                      },
                                      controller: passwordController.text,
                                    ),


                                    /// تأكيد كلمة المرور
                                    EditTextFiled(
                                      labelText: 'تأكيد كلمة المرور',
                                      controller: "",
                                      prefixIcon: const Icon(Icons.password),
                                      initialValue: UpdateCubit
                                          .get(context)
                                          .studentModelUpdate!
                                          .confirmPassword =
                                          getProfileCubit.newStudents!.student
                                              .confirmPassword,
                                      change: (value) {
                                        UpdateCubit
                                            .get(context)
                                            .studentModelUpdate
                                            ?.confirmPassword = value;
                                      },
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              isObscureText = !isObscureText;
                                            },
                                          );
                                        },
                                        icon: isObscureText
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      vaildate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'الرجاء إدخال تأكيد كلمة المرور';
                                        }
                                        if (value.length < 14) {
                                          return 'الرجاء تأكيد كلمة المرور كامل';
                                        }
                                        // if (value != passwordController.text) {
                                        //   return 'تأكيد كلمة المرور غير متطابق';
                                        // }
                                        // return null;
                                      },
                                    ),


                                  ],
                                ),


                              ),
                            ),


                          ),

                          Expanded(flex: 1, child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey,
                                ),
                                child: const Text("إلغاء", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  GetProfileCubit.get(context).GetStudentData(
                                      context);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => const Profile()));
                                } // Close the dialog
                                ,
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffac8600),
                                ),
                                child: const Text("تحديث", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    returnToProfile(
                                        context, getProfileCubit.gpa);
                                  }
                                },
                              ),


                            ],
                          ),)
                        ],
                      ),
                    )
                    ,

                  )
                  ,


                );
              });
        });
  }





}


  returnToProfile(context , isOld)async{
  final res = await UpdateCubit.get(context).choseFunction(isOld);
  if(res==200){
   GetProfileCubit.get(context).UpdateProfile =true ;
  final result = await GetProfileCubit.get(context).GetStudentData(context);
  if(result==200){
    log(GetProfileCubit.get(context).newStudents!.student.name);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Profile()), // Replace with your actual route
    );
  }else{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Go()), // Replace with your actual route
    );
  }
  }else{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Go()), // Replace with your actual route
    );
  }


}

typedef Validation = String? Function(String?)?;
typedef onChanged = void Function(String)?;

class EditTextFiled extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final onChanged change;
  final Validation vaildate;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String controller;

  const EditTextFiled(
      {Key? key,
        required this.labelText,
        required this.initialValue,
        this.change,
        required this.prefixIcon,
        this.suffixIcon,
        this.vaildate, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: const TextStyle(color: Colors.grey),
          ),
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[500]!,
            ),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),

        initialValue: initialValue,
        validator: vaildate,
        onChanged: change,
        //   (value) {
        // initialValue = value; // Update newName as the user types
        //    }
      ),
    );
  }
}

typedef onChangedDrop = void Function(String?)?;

class EditDropDown extends StatelessWidget {
  final String newValue;
  final String textLable;
  final String label1, label2;
  final int? value1, value2;
  final String? stringValue1, stringValue2;
  final Widget prefixIcon;
  final onChangedDrop changeDrop;

  const EditDropDown(
      {Key? key,
        required this.newValue,
        required this.textLable,
        required this.label1,
        required this.label2,
        required this.prefixIcon,
        this.changeDrop,
        this.value1,
        this.value2,
        this.stringValue1,
        this.stringValue2,
        //this.label3, this.stringValue3
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          label: Text(
            textLable,
            style: const TextStyle(color: Colors.grey),
          ),
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[500]!,
            ),
          ),
        ),
        value: newValue,
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: value1.toString(),
            child: Text(label1,
              style: const TextStyle(
                color: Colors.black,
              ),
            ), // Set value to 'Male'
          ),
          DropdownMenuItem<String>(
            value: value2.toString(),
            child: Text(
              label2,
              style: const TextStyle(
                color: Colors.black,
              ),
            ), // Set value to 'Female'
          ),

        ],
        onChanged: changeDrop,

      ),
    );
  }
}


withFood(context) {
  if (GetProfileCubit
      .get(context)
      .newStudents!
      .student.housingWithoutCatering == 1) {
    UpdateCubit
        .get(context)
        .studentModelUpdate
        ?.housingWithoutCatering = 1;
    return GetProfileCubit
        .get(context)
        .newStudents!
        .student.housingWithoutCatering.toString();
  } else {
    UpdateCubit
        .get(context)
        .studentModelUpdate
        ?.housingWithoutCatering = 1;
    return GetProfileCubit
        .get(context)
        .newStudents!
        .student.housingWithoutCatering.toString();
  }
}
special(context){
  if (GetProfileCubit
      .get(context)
      .newStudents!
      .student.specialNeed == 1) {
    UpdateCubit
        .get(context)
        .studentModelUpdate
        ?.specialNeed = 1;
    return GetProfileCubit
        .get(context)
        .newStudents!
        .student.specialNeed.toString();
  } else {
    UpdateCubit
        .get(context)
        .studentModelUpdate
        ?.specialNeed = 0;
    return GetProfileCubit
        .get(context)
        .newStudents!
        .student.specialNeed.toString();
  }
}


List<Map<String, dynamic>> levels = [
  {
    "collage_id": 1,
    'collage_levels': [
      {
        "id": 1,
        "name": "اعدادى"
      },
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 6,
        "name": "الخامسة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 2,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 3,
    'collage_levels': [
      {
        "id": 1,
        "name": "اعدادى"
      },
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 6,
        "name": "الخامسة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 4,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 5,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 6,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 7,
    'collage_levels': [
      {
        "id": 1,
        "name": "اعدادى"
      },
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 6,
        "name": "الخامسة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ]
    ,
  },
  {
    "collage_id": 8,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 9,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 10,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 11,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 12,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 13,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ]
    ,
  },
  {
    "collage_id": 14,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 15,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 16,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 17,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 18,
    'collage_levels':  [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 19,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 20,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 21,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 4,
        "name": "الثالثة"
      },
      {
        "id": 5,
        "name": "الرابعة"
      },
      {
        "id": 6,
        "name": "الخامسة"
      },
      {
        "id": 7,
        "name": "السادسة"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
  {
    "collage_id": 22,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      }
    ],
  },
  {
    "collage_id": 23,
    'collage_levels': [
      {
        "id": 2,
        "name": "الاولى"
      },
      {
        "id": 3,
        "name": "الثانية"
      },
      {
        "id": 8,
        "name": "دراسات عليا"
      }
    ],
  },
];


List<Map<String, dynamic>> city = [
  {
    "governorate_id": 1,
    /// selected governorate
    'cities' : [
      {
        "id": 1,
        "name": "15 مايو",
      },
      {
        "id": 2,
        "name": "الازبكية",
      },
      {
        "id": 3,
        "name": "البساتين",
      },
      {
        "id": 4,
        "name": "التبين",
      },
      {
        "id": 5,
        "name": "الخليفة",
      },
      {
        "id": 6,
        "name": "الدراسة",
      },
      {
        "id": 7,
        "name": "الدرب الاحمر",
      },
      {
        "id": 8,
        "name": "الزاوية الحمراء",
      },
      {
        "id": 9,
        "name": "الزيتون",
      },
      {
        "id": 10,
        "name": "الساحل",
      },
      {
        "id": 11,
        "name": "السلام",
      },
      {
        "id": 12,
        "name": "السيدة زينب",
      },
      {
        "id": 13,
        "name": "الشرابية",
      },
      {
        "id": 14,
        "name": "مدينة الشروق",
      },
      {
        "id": 15,
        "name": "الظاهر",
      },
      {
        "id": 16,
        "name": "العتبة",
      },
      {
        "id": 17,
        "name": "القاهرة الجديدة",
      },
      {
        "id": 18,
        "name": "المرج",
      },
      {
        "id": 19,
        "name": "عزبة النخل",
      },
      {
        "id": 20,
        "name": "المطرية",
      },
      {
        "id": 21,
        "name": "المعادى",
      },
      {
        "id": 22,
        "name": "المعصرة",
      },
      {
        "id": 23,
        "name": "المقطم",
      },
      {
        "id": 24,
        "name": "المنيل",
      },
      {
        "id": 25,
        "name": "الموسكى",
      },
      {
        "id": 26,
        "name": "النزهة",
      },
      {
        "id": 27,
        "name": "الوايلى",
      },
      {
        "id": 28,
        "name": "باب الشعرية",
      },
      {
        "id": 29,
        "name": "بولاق",
      },
      {
        "id": 30,
        "name": "جاردن سيتى",
      },
      {
        "id": 31,
        "name": "حدائق القبة",
      },
      {
        "id": 32,
        "name": "حلوان",
      },
      {
        "id": 33,
        "name": "دار السلام",
      },
      {
        "id": 34,
        "name": "شبرا",
      },
      {
        "id": 35,
        "name": "طره",
      },
      {
        "id": 36,
        "name": "عابدين",
      },
      {
        "id": 37,
        "name": "عباسية",
      },
      {
        "id": 38,
        "name": "عين شمس",
      },
      {
        "id": 39,
        "name": "مدينة نصر",
      },
      {
        "id": 40,
        "name": "مصر الجديدة",
      },
      {
        "id": 41,
        "name": "مصر القديمة",
      },
      {
        "id": 42,
        "name": "منشية ناصر",
      },
      {
        "id": 43,
        "name": "مدينة بدر",
      },
      {
        "id": 44,
        "name": "مدينة العبور",
      },
      {
        "id": 45,
        "name": "وسط البلد",
      },
      {
        "id": 46,
        "name": "الزمالك",
      },
      {
        "id": 47,
        "name": "قصر النيل",
      },
      {
        "id": 48,
        "name": "الرحاب",
      },
      {
        "id": 49,
        "name": "القطامية",
      },
      {
        "id": 50,
        "name": "مدينتي",
      },
      {
        "id": 51,
        "name": "روض الفرج",
      },
      {
        "id": 52,
        "name": "شيراتون",
      },
      {
        "id": 53,
        "name": "الجمالية",
      },
      {
        "id": 54,
        "name": "العاشر من رمضان",
      },
      {
        "id": 55,
        "name": "الحلمية",
      },
      {
        "id": 56,
        "name": "النزهة الجديدة",
      },
      {
        "id": 57,
        "name": "العاصمة الإدارية",
      }
    ]
  },
  ///2
  {
    "governorate_id": 2,
    'cities' :[
      {
        "id": 58,
        "name": "الجيزة",
      },
      {
        "id": 59,
        "name": "السادس من أكتوبر",
      },
      {
        "id": 60,
        "name": "الشيخ زايد",
      },
      {
        "id": 61,
        "name": "الحوامدية",
      },
      {
        "id": 62,
        "name": "البدرشين",
      },
      {
        "id": 63,
        "name": "الصف",
      },
      {
        "id": 64,
        "name": "أطفيح",
      },
      {
        "id": 65,
        "name": "العياط",
      },
      {
        "id": 66,
        "name": "الباويطي",
      },
      {
        "id": 67,
        "name": "منشأة القناطر",
      },
      {
        "id": 68,
        "name": "أوسيم",
      },
      {
        "id": 69,
        "name": "كرداسة",
      },
      {
        "id": 70,
        "name": "أبو النمرس",
      },
      {
        "id": 71,
        "name": "كفر غطاطي",
      },
      {
        "id": 72,
        "name": "منشأة البكاري",
      },
      {
        "id": 73,
        "name": "الدقى",
      },
      {
        "id": 74,
        "name": "العجوزة",
      },
      {
        "id": 75,
        "name": "الهرم",
      },
      {
        "id": 76,
        "name": "الوراق",
      },
      {
        "id": 77,
        "name": "امبابة",
      },
      {
        "id": 78,
        "name": "بولاق الدكرور",
      },
      {
        "id": 79,
        "name": "الواحات البحرية",
      },
      {
        "id": 80,
        "name": "العمرانية",
      },
      {
        "id": 81,
        "name": "المنيب",
      },
      {
        "id": 82,
        "name": "بين السرايات",
      },
      {
        "id": 83,
        "name": "الكيت كات",
      },
      {
        "id": 84,
        "name": "المهندسين",
      },
      {
        "id": 85,
        "name": "فيصل",
      },
      {
        "id": 86,
        "name": "أبو رواش",
      },
      {
        "id": 87,
        "name": "حدائق الأهرام",
      },
      {
        "id": 88,
        "name": "الحرانية",
      },
      {
        "id": 89,
        "name": "حدائق اكتوبر",
      },
      {
        "id": 90,
        "name": "صفط اللبن",
      },
      {
        "id": 91,
        "name": "القرية الذكية",
      },
      {
        "id": 92,
        "name": "ارض اللواء",
      },
    ]
  },

  ///3
  {
    "governorate_id": 3,
    'cities' : [
      {
        "id": 93,
        "name": "ابو قير"
      },
      {
        "id": 94,
        "name": "الابراهيمية"
      },
      {
        "id": 95,
        "name": "الأزاريطة"
      },
      {
        "id": 96,
        "name": "الانفوشى"
      },
      {
        "id": 97,
        "name": "الدخيلة"
      },
      {
        "id": 98,
        "name": "السيوف"
      },
      {
        "id": 99,
        "name": "العامرية"
      },
      {
        "id": 100,
        "name": "اللبان"
      },
      {
        "id": 101,
        "name": "المفروزة"
      },
      {
        "id": 102,
        "name": "المنتزه"
      },
      {
        "id": 103,
        "name": "المنشية"
      },
      {
        "id": 104,
        "name": "الناصرية"
      },
      {
        "id": 105,
        "name": "امبروزو"
      },
      {
        "id": 106,
        "name": "باب شرق"
      },
      {
        "id": 107,
        "name": "برج العرب"
      },
      {
        "id": 108,
        "name": "ستانلى"
      },
      {
        "id": 109,
        "name": "سموحة"
      },
      {
        "id": 110,
        "name": "سيدى بشر"
      },
      {
        "id": 111,
        "name": "شدس"
      },
      {
        "id": 112,
        "name": "غيط العنب"
      },
      {
        "id": 113,
        "name": "فلمينج"
      },
      {
        "id": 114,
        "name": "فيكتوريا"
      },
      {
        "id": 115,
        "name": "كامب شيزار"
      },
      {
        "id": 116,
        "name": "كرموز"
      },
      {
        "id": 117,
        "name": "محطة الرمل"
      },
      {
        "id": 118,
        "name": "مينا البصل"
      },
      {
        "id": 119,
        "name": "العصافرة"
      },
      {
        "id": 120,
        "name": "العجمي"
      },
      {
        "id": 121,
        "name": "بكوس"
      },
      {
        "id": 122,
        "name": "بولكلي"
      },
      {
        "id": 123,
        "name": "كليوباترا"
      },
      {
        "id": 124,
        "name": "جليم"
      },
      {
        "id": 125,
        "name": "المعمورة"
      },
      {
        "id": 126,
        "name": "المندرة"
      },
      {
        "id": 127,
        "name": "محرم بك"
      },
      {
        "id": 128,
        "name": "الشاطبي"
      },
      {
        "id": 129,
        "name": "سيدي جابر"
      },
      {
        "id": 130,
        "name": "الساحل الشمالي"
      },
      {
        "id": 131,
        "name": "الحضرة"
      },
      {
        "id": 132,
        "name": "العطارين"
      },
      {
        "id": 133,
        "name": "سيدي كرير"
      },
      {
        "id": 134,
        "name": "الجمرك"
      },
      {
        "id": 135,
        "name": "المكس"
      },
      {
        "id": 136,
        "name": "مارينا"
      }
    ]
    ,
  },
  ///4
  {
    "governorate_id": 4,
    'cities' : [
      {
        "id": 137,
        "name": "المنصورة"
      },
      {
        "id": 138,
        "name": "طلخا"
      },
      {
        "id": 139,
        "name": "ميت غمر"
      },
      {
        "id": 140,
        "name": "دكرنس"
      },
      {
        "id": 141,
        "name": "أجا"
      },
      {
        "id": 142,
        "name": "منية النصر"
      },
      {
        "id": 143,
        "name": "السنبلاوين"
      },
      {
        "id": 144,
        "name": "الكردي"
      },
      {
        "id": 145,
        "name": "بني عبيد"
      },
      {
        "id": 146,
        "name": "المنزلة"
      },
      {
        "id": 147,
        "name": "تمي الأمديد"
      },
      {
        "id": 148,
        "name": "الجمالية"
      },
      {
        "id": 149,
        "name": "شربين"
      },
      {
        "id": 150,
        "name": "المطرية"
      },
      {
        "id": 151,
        "name": "بلقاس"
      },
      {
        "id": 152,
        "name": "ميت سلسيل"
      },
      {
        "id": 153,
        "name": "جمصة"
      },
      {
        "id": 154,
        "name": "محلة دمنة"
      },
      {
        "id": 155,
        "name": "نبروه"
      }
    ]

  },
  ///5
  {
    "governorate_id": 5,
    'cities' : [
      {
        "id": 156,
        "name": "الغردقة"
      },
      {
        "id": 157,
        "name": "رأس غارب"
      },
      {
        "id": 158,
        "name": "سفاجا"
      },
      {
        "id": 159,
        "name": "القصير"
      },
      {
        "id": 160,
        "name": "مرسى علم"
      },
      {
        "id": 161,
        "name": "الشلاتين"
      },
      {
        "id": 162,
        "name": "حلايب"
      },
      {
        "id": 163,
        "name": "الدهار"
      }
    ]

  },
  ///6
  {
    "governorate_id": 6,
    'cities' : [
      {
        "id": 164,
        "name": "دمنهور"
      },
      {
        "id": 165,
        "name": "كفر الدوار"
      },
      {
        "id": 166,
        "name": "رشيد"
      },
      {
        "id": 167,
        "name": "إدكو"
      },
      {
        "id": 168,
        "name": "أبو المطامير"
      },
      {
        "id": 169,
        "name": "أبو حمص"
      },
      {
        "id": 170,
        "name": "الدلنجات"
      },
      {
        "id": 171,
        "name": "المحمودية"
      },
      {
        "id": 172,
        "name": "الرحمانية"
      },
      {
        "id": 173,
        "name": "إيتاي البارود"
      },
      {
        "id": 174,
        "name": "حوش عيسى"
      },
      {
        "id": 175,
        "name": "شبراخيت"
      },
      {
        "id": 176,
        "name": "كوم حمادة"
      },
      {
        "id": 177,
        "name": "بدر"
      },
      {
        "id": 178,
        "name": "وادي النطرون"
      },
      {
        "id": 179,
        "name": "النوبارية الجديدة"
      },
      {
        "id": 180,
        "name": "النوبارية"
      }
    ]

  },
  ///7
  {
    "governorate_id": 7,
    'cities' :
    [
      {
        "id": 181,
        "name": "الفيوم"
      },
      {
        "id": 182,
        "name": "الفيوم الجديدة"
      },
      {
        "id": 183,
        "name": "طامية"
      },
      {
        "id": 184,
        "name": "سنورس"
      },
      {
        "id": 185,
        "name": "إطسا"
      },
      {
        "id": 186,
        "name": "إبشواي"
      },
      {
        "id": 187,
        "name": "يوسف الصديق"
      },
      {
        "id": 188,
        "name": "الحادقة"
      },
      {
        "id": 189,
        "name": "اطسا"
      },
      {
        "id": 190,
        "name": "الجامعة"
      },
      {
        "id": 191,
        "name": "السيالة"
      }
    ]

  },
  ///8
  {
    "governorate_id": 8,
    'cities' : [
      {
        "id": 192,
        "name": "طنطا"
      },
      {
        "id": 193,
        "name": "المحلة الكبرى"
      },
      {
        "id": 194,
        "name": "كفر الزيات"
      },
      {
        "id": 195,
        "name": "زفتى"
      },
      {
        "id": 196,
        "name": "السنطة"
      },
      {
        "id": 197,
        "name": "قطور"
      },
      {
        "id": 198,
        "name": "بسيون"
      },
      {
        "id": 199,
        "name": "سمنود"
      }
    ]

  },
  ///9
  {
    "governorate_id": 9,
    'cities' :
    [
      {
        "id": 200,
        "name": "الإسماعيلية"
      },
      {
        "id": 201,
        "name": "فايد"
      },
      {
        "id": 202,
        "name": "القنطرة شرق"
      },
      {
        "id": 203,
        "name": "القنطرة غرب"
      },
      {
        "id": 204,
        "name": "التل الكبير"
      },
      {
        "id": 205,
        "name": "أبو صوير"
      },
      {
        "id": 206,
        "name": "القصاصين الجديدة"
      },
      {
        "id": 207,
        "name": "نفيشة"
      },
      {
        "id": 208,
        "name": "الشيخ زايد"
      }
    ]

  },
  ///10
  {
    "governorate_id": 10,
    'cities' :
    [
      {
        "id": 209,
        "name": "شبين الكوم"
      },
      {
        "id": 210,
        "name": "مدينة السادات"
      },
      {
        "id": 211,
        "name": "منوف"
      },
      {
        "id": 212,
        "name": "سرس الليان"
      },
      {
        "id": 213,
        "name": "أشمون"
      },
      {
        "id": 214,
        "name": "الباجور"
      },
      {
        "id": 215,
        "name": "قويسنا"
      },
      {
        "id": 216,
        "name": "بركة السبع"
      },
      {
        "id": 217,
        "name": "تلا"
      },
      {
        "id": 218,
        "name": "الشهداء"
      }
    ]
  },
  ///11
  {
    "governorate_id": 11,
    'cities' : [
      {
        "id": 219,
        "name": "المنيا"
      },
      {
        "id": 220,
        "name": "المنيا الجديدة"
      },
      {
        "id": 221,
        "name": "العدوة"
      },
      {
        "id": 222,
        "name": "مغاغة"
      },
      {
        "id": 223,
        "name": "بني مزار"
      },
      {
        "id": 224,
        "name": "مطاي"
      },
      {
        "id": 225,
        "name": "سمالوط"
      },
      {
        "id": 226,
        "name": "المدينة الفكرية"
      },
      {
        "id": 227,
        "name": "ملوي"
      },
      {
        "id": 228,
        "name": "دير مواس"
      },
      {
        "id": 229,
        "name": "ابو قرقاص"
      },
      {
        "id": 230,
        "name": "ارض سلطان"
      }
    ]

  },
  ///12
  {
    "governorate_id": 12,
    'cities' : [
      {
        "id": 231,
        "name": "بنها"
      },
      {
        "id": 232,
        "name": "قليوب"
      },
      {
        "id": 233,
        "name": "شبرا الخيمة"
      },
      {
        "id": 234,
        "name": "القناطر الخيرية"
      },
      {
        "id": 235,
        "name": "الخانكة"
      },
      {
        "id": 236,
        "name": "كفر شكر"
      },
      {
        "id": 237,
        "name": "طوخ"
      },
      {
        "id": 238,
        "name": "قها"
      },
      {
        "id": 239,
        "name": "العبور"
      },
      {
        "id": 240,
        "name": "الخصوص"
      },
      {
        "id": 241,
        "name": "شبين القناطر"
      },
      {
        "id": 242,
        "name": "مسطرد"
      }
    ]

  },
  ///13
  {
    "governorate_id": 13,
    'cities' : [
      {
        "id": 243,
        "name": "الخارجة"
      },
      {
        "id": 244,
        "name": "باريس"
      },
      {
        "id": 245,
        "name": "موط"
      },
      {
        "id": 246,
        "name": "الفرافرة"
      },
      {
        "id": 247,
        "name": "بلاط"
      },
      {
        "id": 248,
        "name": "الداخلة"
      }
    ]

  },
  ///14
  {
    "governorate_id": 14,
    'cities' : [
      {
        "id": 249,
        "name": "السويس"
      },
      {
        "id": 250,
        "name": "الجناين"
      },
      {
        "id": 251,
        "name": "عتاقة"
      },
      {
        "id": 252,
        "name": "العين السخنة"
      },
      {
        "id": 253,
        "name": "فيصل"
      }
    ]

  },
  ///15
  {
    "governorate_id": 15,
    'cities' : [
      {
        "id": 254,
        "name": "أسوان"
      },
      {
        "id": 255,
        "name": "أسوان الجديدة"
      },
      {
        "id": 256,
        "name": "دراو"
      },
      {
        "id": 257,
        "name": "كوم أمبو"
      },
      {
        "id": 258,
        "name": "نصر النوبة"
      },
      {
        "id": 259,
        "name": "كلابشة"
      },
      {
        "id": 260,
        "name": "إدفو"
      },
      {
        "id": 261,
        "name": "الرديسية"
      },
      {
        "id": 262,
        "name": "البصيلية"
      },
      {
        "id": 263,
        "name": "السباعية"
      },
      {
        "id": 264,
        "name": "ابوسمبل السياحية"
      },
      {
        "id": 265,
        "name": "مرسى علم"
      }
    ]

  },
  ///16
  {
    "governorate_id": 16,
    'cities' : [
      {
        "id": 266,
        "name": "أسيوط"
      },
      {
        "id": 267,
        "name": "أسيوط الجديدة"
      },
      {
        "id": 268,
        "name": "ديروط"
      },
      {
        "id": 269,
        "name": "منفلوط"
      },
      {
        "id": 270,
        "name": "القوصية"
      },
      {
        "id": 271,
        "name": "أبنوب"
      },
      {
        "id": 272,
        "name": "أبو تيج"
      },
      {
        "id": 273,
        "name": "الغنايم"
      },
      {
        "id": 274,
        "name": "ساحل سليم"
      },
      {
        "id": 275,
        "name": "البداري"
      },
      {
        "id": 276,
        "name": "صدفا"
      }
    ]

  },
  ///17
  {
    "governorate_id": 17,
    'cities' : [
      {
        "id": 277,
        "name": "بني سويف"
      },
      {
        "id": 278,
        "name": "بني سويف الجديدة"
      },
      {
        "id": 279,
        "name": "الواسطى"
      },
      {
        "id": 280,
        "name": "ناصر"
      },
      {
        "id": 281,
        "name": "إهناسيا"
      },
      {
        "id": 282,
        "name": "ببا"
      },
      {
        "id": 283,
        "name": "الفشن"
      },
      {
        "id": 284,
        "name": "سمسطا"
      },
      {
        "id": 285,
        "name": "الاباصيرى"
      },
      {
        "id": 286,
        "name": "مقبل"
      }
    ]

  },
  ///18
  {
    "governorate_id": 18,
    'cities' : [
      {
        "id": 287,
        "name": "بورسعيد"
      },
      {
        "id": 288,
        "name": "بورفؤاد"
      },
      {
        "id": 289,
        "name": "العرب"
      },
      {
        "id": 290,
        "name": "حى الزهور"
      },
      {
        "id": 291,
        "name": "حى الشرق"
      },
      {
        "id": 292,
        "name": "حى الضواحى"
      },
      {
        "id": 293,
        "name": "حى المناخ"
      },
      {
        "id": 294,
        "name": "حى مبارك"
      }
    ]

  },
  ///19
  {
    "governorate_id": 19,
    'cities' : [
      {
        "id": 295,
        "name": "دمياط"
      },
      {
        "id": 296,
        "name": "دمياط الجديدة"
      },
      {
        "id": 297,
        "name": "رأس البر"
      },
      {
        "id": 298,
        "name": "فارسكور"
      },
      {
        "id": 299,
        "name": "الزرقا"
      },
      {
        "id": 300,
        "name": "السرو"
      },
      {
        "id": 301,
        "name": "الروضة"
      },
      {
        "id": 302,
        "name": "كفر البطيخ"
      },
      {
        "id": 303,
        "name": "عزبة البرج"
      },
      {
        "id": 304,
        "name": "ميت أبو غالب"
      },
      {
        "id": 305,
        "name": "كفر سعد"
      }
    ]

  },
  ///20
  {
    "governorate_id": 20,
    'cities' : [
      {
        "id": 306,
        "name": "الزقازيق"
      },
      {
        "id": 307,
        "name": "العاشر من رمضان"
      },
      {
        "id": 308,
        "name": "منيا القمح"
      },
      {
        "id": 309,
        "name": "بلبيس"
      },
      {
        "id": 310,
        "name": "مشتول السوق"
      },
      {
        "id": 311,
        "name": "القنايات"
      },
      {
        "id": 312,
        "name": "أبو حماد"
      },
      {
        "id": 313,
        "name": "القرين"
      },
      {
        "id": 314,
        "name": "ههيا"
      },
      {
        "id": 315,
        "name": "أبو كبير"
      },
      {
        "id": 316,
        "name": "فاقوس"
      },
      {
        "id": 317,
        "name": "الصالحية الجديدة"
      },
      {
        "id": 318,
        "name": "الإبراهيمية"
      },
      {
        "id": 319,
        "name": "ديرب نجم"
      },
      {
        "id": 320,
        "name": "كفر صقر"
      },
      {
        "id": 321,
        "name": "أولاد صقر"
      },
      {
        "id": 322,
        "name": "الحسينية"
      },
      {
        "id": 323,
        "name": "صان الحجر القبلية"
      },
      {
        "id": 324,
        "name": "منشأة أبو عمر"
      }
    ]

  },
  ///21
  {
    "governorate_id": 21,
    'cities' : [
      {
        "id": 325,
        "name": "الطور"
      },
      {
        "id": 326,
        "name": "شرم الشيخ"
      },
      {
        "id": 327,
        "name": "دهب"
      },
      {
        "id": 328,
        "name": "نويبع"
      },
      {
        "id": 329,
        "name": "طابا"
      },
      {
        "id": 330,
        "name": "سانت كاترين"
      },
      {
        "id": 331,
        "name": "أبو رديس"
      },
      {
        "id": 332,
        "name": "أبو زنيمة"
      },
      {
        "id": 333,
        "name": "رأس سدر"
      }
    ]

  },
  ///22
  {
    "governorate_id": 22,
    'cities' : [
      {
        "id": 334,
        "name": "كفر الشيخ"
      },
      {
        "id": 335,
        "name": "وسط البلد كفر الشيخ"
      },
      {
        "id": 336,
        "name": "دسوق"
      },
      {
        "id": 337,
        "name": "فوه"
      },
      {
        "id": 338,
        "name": "مطوبس"
      },
      {
        "id": 339,
        "name": "برج البرلس"
      },
      {
        "id": 340,
        "name": "بلطيم"
      },
      {
        "id": 341,
        "name": "مصيف بلطيم"
      },
      {
        "id": 342,
        "name": "الحامول"
      },
      {
        "id": 343,
        "name": "بيلا"
      },
      {
        "id": 344,
        "name": "الرياض"
      },
      {
        "id": 345,
        "name": "سيدي سالم"
      },
      {
        "id": 346,
        "name": "قلين"
      },
      {
        "id": 347,
        "name": "سيدي غازي"
      }
    ]

  },
  ///23
  {
    "governorate_id": 23,
    'cities' : [
      {
        "id": 348,
        "name": "مرسى مطروح"
      },
      {
        "id": 349,
        "name": "الحمام"
      },
      {
        "id": 350,
        "name": "العلمين"
      },
      {
        "id": 351,
        "name": "الضبعة"
      },
      {
        "id": 352,
        "name": "النجيلة"
      },
      {
        "id": 353,
        "name": "سيدي براني"
      },
      {
        "id": 354,
        "name": "السلوم"
      },
      {
        "id": 355,
        "name": "سيوة"
      },
      {
        "id": 356,
        "name": "مارينا"
      },
      {
        "id": 357,
        "name": "الساحل الشمالى"
      }
    ]

  },
  ///24
  {
    "governorate_id": 24,
    'cities' : [
      {
        "id": 358,
        "name": "الأقصر"
      },
      {
        "id": 359,
        "name": "الأقصر الجديدة"
      },
      {
        "id": 360,
        "name": "إسنا"
      },
      {
        "id": 361,
        "name": "طيبة الجديدة"
      },
      {
        "id": 362,
        "name": "الزينية"
      },
      {
        "id": 363,
        "name": "البياضية"
      },
      {
        "id": 364,
        "name": "القرنة"
      },
      {
        "id": 365,
        "name": "أرمنت"
      },
      {
        "id": 366,
        "name": "الطود"
      }
    ]

  },
  ///25
  {
    "governorate_id": 25,
    'cities' : [
      {
        "id": 367,
        "name": "قنا"
      },
      {
        "id": 368,
        "name": "قنا الجديدة"
      },
      {
        "id": 369,
        "name": "ابو طشت"
      },
      {
        "id": 370,
        "name": "نجع حمادي"
      },
      {
        "id": 371,
        "name": "دشنا"
      },
      {
        "id": 372,
        "name": "الوقف"
      },
      {
        "id": 373,
        "name": "قفط"
      },
      {
        "id": 374,
        "name": "نقادة"
      },
      {
        "id": 375,
        "name": "فرشوط"
      },
      {
        "id": 376,
        "name": "قوص"
      }
    ]

  },
  ///26
  {
    "governorate_id": 26,
    'cities' : [
      {
        "id": 377,
        "name": "العريش"
      },
      {
        "id": 378,
        "name": "الشيخ زويد"
      },
      {
        "id": 379,
        "name": "نخل"
      },
      {
        "id": 380,
        "name": "رفح"
      },
      {
        "id": 381,
        "name": "بئر العبد"
      },
      {
        "id": 382,
        "name": "الحسنة"
      }
    ]

  },
  ///27
  {
    "governorate_id": 27,
    'cities' : [
      {
        "id": 383,
        "name": "سوهاج",
      },
      {
        "id": 384,
        "name": "سوهاج الجديدة",
      },
      {
        "id": 385,
        "name": "أخميم",
      },
      {
        "id": 386,
        "name": "أخميم الجديدة",
      },
      {
        "id": 387,
        "name": "البلينا",
      },
      {
        "id": 388,
        "name": "المراغة",
      },
      {
        "id": 389,
        "name": "المنشأة",
      },
      {
        "id": 390,
        "name": "دار السلام",
      },
      {
        "id": 391,
        "name": "جرجا",
      },
      {
        "id": 392,
        "name": "جهينة الغربية",
      },
      {
        "id": 393,
        "name": "ساقلته",
      },
      {
        "id": 394,
        "name": "طما",
      },
      {
        "id": 395,
        "name": "طهطا",
      },
      {
        "id": 396,
        "name": "الكوثر",
      }
    ],
  }
];

