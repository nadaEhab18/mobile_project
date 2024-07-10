import 'package:flutter/material.dart';

import '../../core/controllers/newStudent/request_form_controller/new_student_cubit.dart';
import '../../widgets/customSwitch.dart';
import '../../widgets/customTextFormField.dart';


class FacultyNewStudent extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const FacultyNewStudent({Key? key, required this.formKey}) : super(key: key);

  @override
  State<FacultyNewStudent> createState() => _FacultyNewStudentState();
}

class _FacultyNewStudentState extends State<FacultyNewStudent> {
  bool newSpecialPeople = false;
  bool newWithFood = false;
  bool studyOut = false;
  bool newIsObscureText = true;
  String? newDropHousingType;
  String? newDropHousingPerson;
  String? newDropScorePerson;

  TextEditingController newEmailController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newConfirmPasswordController = TextEditingController();
  TextEditingController newPercentController = TextEditingController();
  TextEditingController newDepartmentController = TextEditingController();

  String? newDropCollage;
  int? newSelectedCollage;
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

  int? newSelectedLevel;
  List<Map<String, dynamic>> getLevels(int collageId) {
    return levels
        .firstWhere((element) => element['collage_id'] == collageId)['collage_levels'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 120),
          child: Image.asset(
            'assets/images/helwanLogoo.png',
            // height: 400,
          ),
        ),
        Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              /// البريد الالكترونى
              CustomTextFormField(
                label: 'البريد الالكترونى',
                typeKeyBoard: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email),
                controller: newEmailController,
                validator: (value) {
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
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.email  = p0 ;
                  },


              ),
              /// الكلية و الفرقة
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                ),
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    label: Text('الكلية'),
                    prefixIcon: Icon(Icons.yard),
                    border: InputBorder.none,
                  ),
                  onChanged: (val) async {
                    setState(() {
                      newSelectedCollage = val;
                      newSelectedLevel = null; // Reset selected city when governorate changes.
                        NewStudentCubit.get(context).new_student.collegeId  = newSelectedCollage ;
                      print("Collage : $newSelectedCollage");
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'الرجاء اختيار الكلية';
                    }
                    return null;
                  },
                  value: newSelectedCollage,
                  items: collages
                      .asMap()
                      .map((index, value) {
                        int newCollageValue = index + 1;
                        return MapEntry(
                          index,
                          DropdownMenuItem<int>(
                            child: Text(value),
                            value: newCollageValue,
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ),

              ///الفرقة
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                ),
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    label: Text('الفرقة'),
                    prefixIcon: Icon(Icons.yard),
                    border: InputBorder.none,
                  ),
                  onChanged: (val) async {
                    setState(() {
                      newSelectedLevel = val;
                      NewStudentCubit.get(context).new_student.levelId = newSelectedLevel ;
                      print("Level : $newSelectedLevel");
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'الرجاء اختيار الفرقة';
                    }
                    return null;
                  },
                  value: newSelectedLevel,
                  items: newSelectedCollage != null
                      ? getLevels(newSelectedCollage!).asMap()
                      .map((index, value) {
                    int newLevelValue = value['id'];
                    return MapEntry(
                      index,
                      DropdownMenuItem<int>(
                        child: Text(value['name']),
                        value: newLevelValue,
                      ),
                    );
                  })
                      .values
                      .toList()
                      : [],
                ),
              ),

              /// شعبة الثانوية العامة
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'شعبة الثانوية العامة',
                        textDirection: TextDirection.rtl,
                      ),
                      prefixIcon: Icon(Icons.bar_chart),
                      border: InputBorder.none,
                    ),
                    //  hint:Text('شعبة الثانوية العامة'),
                    onChanged: (val) {
                      setState(() {
                        newDropScorePerson = val as String;
                          NewStudentCubit.get(context).new_student.secondaryEducationDivision  = newDropScorePerson ;

                        print('studentEductionType : $newDropScorePerson');
                      });
                    },
                    validator: (value) {
                      if (value == null || (value as String).isEmpty) {
                        return 'الرجاء اختيار شعبة الثانوية العامة';
                      }
                      return null;
                    },
                    value: newDropScorePerson,
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
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
              ),

              ///الثانوية العامة من الخارج
              CustomSwitch(
                switchTitle: 'الثانوية العامة من الخارج',
                switchValue: studyOut,
                changeFunction: (newValue) {
                  setState(() {
                    studyOut = newValue;
                    int studyOutInt = 1 ;
                    NewStudentCubit.get(context).new_student.secondaryEducationAbroad = studyOutInt  ;
                    print('studyOut :$studyOut');
                  });
                },
              ),

              /// مجموع الثانوية العامة
              CustomTextFormField(
                label: 'مجموع الثانوية العامة',
                typeKeyBoard: TextInputType.number,
                prefixIcon: Icon(Icons.school_outlined),
                controller: resultController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال مجموع الثانوية العامة ';
                  }

                  if (value.length < 3) {
                    return 'الرجاء إدخال مجموع الثانوية العامة';
                  }
                  return null;
                },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.secondaryEducationTotalScore  = int.parse(p0!);
                  },
                  showInput: () {
                    print('result : ${resultController.text}');
                  }
              ),

              /// نسبة الثانوية العامة
              CustomTextFormField(
                label: 'نسبة المئوية',
                typeKeyBoard: TextInputType.number,
                controller: newPercentController,
                prefixIcon: Icon(Icons.percent_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال نسبة الثانوية العامة';
                  }
                  if (value.length < 2) {
                    return 'الرجاء إدخال نسبة الثانوية العامة';
                  }
                  return null;
                },
                  onChanged: (p0){
                NewStudentCubit.get(context).new_student.secondaryEducationRate  = int.parse(p0!) ;
              },
              ),

              /// نوع السكن
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('نوع السكن'),
                    prefixIcon: Icon(Icons.home_work_outlined),
                    border: InputBorder.none,
                  ),
                  // hint:Text('نوع السكن'),
                  onChanged: (val) {
                    setState(() {
                      newDropHousingType = val as String;
                        NewStudentCubit.get(context).new_student.housingType  = newDropHousingType ;
                      print('HousingType : $newDropHousingType');
                    });
                  },
                  validator: (value) {
                    if (value == null || (value as String).isEmpty) {
                      return 'الرجاء اختيار نوع السكن';
                    }
                    return null;
                  },
                  value: newDropHousingType,
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      child: Text('عادى'),
                      value: 'nonspecial',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('مميز'),
                      value: 'special',
                    )
                  ],
                ),
              ),

              /// سكن بدون بتغذية
              CustomSwitch(
                switchTitle: 'سكن بدون بتغذية',
                switchValue: newWithFood,
                changeFunction: (newValue) {
                  setState(() {
                    newWithFood = newValue;
                    int newWithFoodInt = 1 ;
                      NewStudentCubit.get(context).new_student.housingWithoutCatering  =newWithFoodInt ;

                  });
                },
              ),

              /// ذوى الاختياجات الخاصة
              CustomSwitch(
                switchTitle: 'ذوى الاختياجات الخاص',
                switchValue: newSpecialPeople,
                changeFunction: (newValue) {
                  setState(() {
                    newSpecialPeople = newValue;
                    int newSpecialPeopleInt  =1 ;
                    NewStudentCubit.get(context).new_student.specialNeed  = newSpecialPeopleInt ;

                  });
                },
              ),

              /// كلمة المرور
              CustomTextFormField(
                label: 'كلمة المرور',
                typeKeyBoard: TextInputType.visiblePassword,
                controller: newPasswordController,
                obscureText: newIsObscureText,
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        newIsObscureText = !newIsObscureText;
                      },
                    );
                  },
                  icon: newIsObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال كلمة المرور';
                  }
                  if (value.length < 8) {
                    return 'الرجاء إدخال كلمة المرور كامل';
                  }
                  return null;
                },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.password  = p0 ;
                  },

                  showInput: () {
                    print('newPassword : ${newPasswordController.text}');
                  }
              ),

              /// تأكيد كلمة المرور
              CustomTextFormField(
                label: 'تأكيد كلمة المرور',
                typeKeyBoard: TextInputType.visiblePassword,
                controller: newConfirmPasswordController,
                obscureText: newIsObscureText,
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        newIsObscureText = !newIsObscureText;
                      },
                    );
                  },
                  icon: newIsObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال تأكيد كلمة المرور';
                  }
                  // if (value.length < 5) {
                  //   return 'الرجاء تأكيد كلمة المرور كامل';
                  // }
                  if (value != newPasswordController.text) {
                    return 'تأكيد كلمة المرور غير متطابق';
                  }
                  return null;
                },onChanged: (p0){
                NewStudentCubit.get(context).new_student.confirmPassword  = p0 ;
              },

                  showInput: () {
                    print('newConfirmPassword : ${newConfirmPasswordController.text}');
                  }
              ),
            ],
          ),
        ),
      ]),
    );
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
}
