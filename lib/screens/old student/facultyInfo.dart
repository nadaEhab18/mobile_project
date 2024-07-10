import 'package:flutter/material.dart';
import '../../core/controllers/oldStudent/request_form_controller/old_student_cubit.dart';
import '../../core/controllers/oldStudent/request_form_controller/old_student_status.dart';
import '../../widgets/customSwitch.dart';
import '../../widgets/customTextFormField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FacultyInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const FacultyInfo({Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  State<FacultyInfo> createState() => _FacultyInfoState();
}

class _FacultyInfoState extends State<FacultyInfo> {
  bool specialPeople = false;
  bool withFood = false;
  bool isObscureText = true;
  String? dropHousingType;
  String? previousHousingPerson;
  int? dropScorePerson;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController percentController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

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
  int? selectedLevel;
  List<Map<String, dynamic>> getLevels(int collageId) {
     return levels
        .firstWhere((element) => element['collage_id'] == collageId)['collage_levels'];
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OldStudentCubit , OldStudentStatus>(listener: (contxt , state){} ,
      builder: (context , state) {
        OldStudentCubit.get(context);
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
                prefixIcon: const Icon(Icons.email),
                controller: emailController,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return   'الرجاء إدخال البريد الالكترونى ';
                }
                if (!value.contains('@')) {
                  return   'الرجاء إدخال البريد الالكترونى صح';
                }
                if (value.length < 10) {
                  return   'الرجاء إدخال البريد الالكترونى';
                }
                return   null;
              },
              onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.email = p0 ; 
              },
              ),

              /// الكلية و الفرقة
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                       selectedLevel = null; // Reset selected city when governorate changes.
                      OldStudentCubit.get(context).studentModel.collegeId = selectedCollage ; 
                      print("Collage : $selectedCollage");
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'الرجاء اختيار الكلية';
                    }
                    return null;
                  },
                  value: selectedCollage,
                  items: collages
                      .asMap()
                      .map((index, value) {
                        int collageValue = index + 1;
                        return MapEntry(
                          index,
                          DropdownMenuItem<int>(
                            child: Text(value),
                            value: collageValue,
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ),

              ///الفرقة
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      OldStudentCubit.get(context).studentModel.levelId = selectedLevel ;   
                      print("Level : $selectedLevel");
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'الرجاء اختيار الفرقة';
                    }
                    return null;
                  },
                  value: selectedLevel,
                  items: selectedCollage != null
                      ? getLevels(selectedCollage!).asMap()
                      .map((index, value) {
                    int levelValue = value['id'];
                    return MapEntry(
                      index,
                      DropdownMenuItem<int>(
                        child: Text(value['name']),
                        value: levelValue,
                      ),
                    );
                  })
                      .values
                      .toList()
                      : [],
                ),
              ),

              /// القسم
            CustomTextFormField(
                label: 'القسم (الشعبة)',
                typeKeyBoard: TextInputType.text,
                prefixIcon: const Icon(Icons.add_business_rounded),
                controller: departmentController,
                validator: (value){
                    if (value == null || value.isEmpty) {
                      return  'الرجاء إدخال القسم (الشعبة) ';
                    }
                    if (value.length < 10) {
                      return   'الرجاء إدخال القسم (الشعبة)';
                    }
                    return  null;
                  },
                  onChanged: (p0) {
                      OldStudentCubit.get(context).studentModel.department = p0 ; 
                      },
              ),
              

              /// تقدير العام الماضى
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    label: Text('تقدير العام الماضى'),
                    prefixIcon: Icon(Icons.bar_chart),
                    border: InputBorder.none,
                  ),
                  //  hint:Text('تقدير العام الماضى'),
                  onChanged: (val) {
                    setState(() {
                      dropScorePerson = val  as int ;
                      OldStudentCubit.get(context).studentModel.gpaId = val ; 
                      print('scoreLastYear : $dropScorePerson');
                    });
                  },
                  validator: (value) {
                    if (value == null ) {
                      return 'الرجاء اختيار تقدير العام الماضى';
                    }
                    return null;
                  },
                  value: dropScorePerson,
                  items: personScore
                      .asMap()
                      .map((index, value) {
                    int personScoreValue = index + 1;
                    return MapEntry(
                      index,
                      DropdownMenuItem<int>(
                        child: Text(value),
                        value: personScoreValue,
                      ),
                    );
                  })
                      .values
                      .toList(),
                ),
              ),

              /// نسبة المئوية
              CustomTextFormField(
                label: 'نسبة المئوية/(gpa)',
                typeKeyBoard: TextInputType.number,
                controller: percentController,
                prefixIcon: const Icon(Icons.percent_outlined),
                validator: (value){
                if (value == null || value.isEmpty) {
                  return   '(gpa)/الرجاء إدخال نسبة المئوية';
                }
                if (value.length < 2) {
                  return   'الرجاء إدخال نسبة المئوية/(gpa)';
                }
                return   null;
                },
                onChanged: (p0) {
                  double successRate = double.parse(p0!);
                      OldStudentCubit.get(context).studentModel.successRate = successRate; 
                      },
              ),

              /// السكن فى الاعوام السابقة
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    label: Text('السكن فى الاعوام السابقة'),
                    prefixIcon: Icon(Icons.info),
                    border: InputBorder.none,
                  ),
                  //  hint:Text('السكن فى الاعوام السابقة'),
                  onChanged: (val) {
                    setState(() {
                      previousHousingPerson = val as String;
                      OldStudentCubit.get(context).studentModel.housingPreviousYear = previousHousingPerson  ; 
                      print('priviousHousingPerson : $previousHousingPerson');
                    });
                  },
                  validator: (value) {
                    if (value == null || (value as String).isEmpty) {
                      return 'الرجاء اختيار السكن فى الاعوام السابقة';
                    }
                    return null;
                  },
                  value: previousHousingPerson,
                  items: <DropdownMenuItem<String>>[
                    const DropdownMenuItem<String>(
                      child: Text('قديم'),
                      value: 'Old',
                    ),
                    const DropdownMenuItem<String>(
                      child: Text('مستجد'),
                      value: 'New',
                    ),
                    const DropdownMenuItem<String>(
                      child: Text('منقطع'),
                      value: 'Interrupted',
                    ),
                  ],
                ),
              ),

              /// نوع السكن
             Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    label: Text('نوع السكن'),
                    prefixIcon: Icon(Icons.home_work_outlined),
                    border: InputBorder.none,
                  ),
                  // hint:Text('نوع السكن'),
                  onChanged: (val) {
                    setState(() {
                      dropHousingType = val as String;
                      OldStudentCubit.get(context).studentModel.housingType = dropHousingType ; 
                      print('HousingType : $dropHousingType');
                    });
                  },
                  validator: (value) {
                    if (value == null || (value as String).isEmpty) {
                      return 'الرجاء اختيار نوع السكن';
                    }
                    return null;
                  },
                  value: dropHousingType,
                  items: const <DropdownMenuItem<String>>[
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
                switchValue: withFood,
                changeFunction: (newValue) {
                  setState(() {
                    withFood = newValue;
                    int? withFoodInt;
                    if(withFood == true){
                      withFoodInt = 1;
                    }else{
                      withFoodInt=0;
                    }
                    OldStudentCubit.get(context).studentModel.housingWithoutCatering = withFoodInt ;
                    print('food : $withFood');
                  });
                     
                },
              ),

              /// ذوى الاختياجات الخاصة
              CustomSwitch(
                switchTitle: 'ذوى الاختياجات الخاص',
                switchValue: specialPeople,
                changeFunction: (newValue) {
                  setState(() {
                    specialPeople = newValue;
                    int?specialNeedInt;
                    if(specialPeople == true) {
                       specialNeedInt = 1;
                    }else{
                       specialNeedInt = 1;
                    }
                    OldStudentCubit.get(context).studentModel.specialNeed = specialNeedInt ;
                    print('specialPeople : $specialPeople');
                  });
                 
                
                             }

              ),

              /// كلمة المرور
              CustomTextFormField(
                label: 'كلمة المرور',
                typeKeyBoard: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: isObscureText,
                prefixIcon: const Icon(Icons.password),
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
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return  'الرجاء إدخال كلمة المرور';
                }
                if (value.length < 8) {
                  return   'الرجاء إدخال كلمة المرور كامل';
                }
                return   null;
                },
                onChanged: ((p0) {
                  OldStudentCubit.get(context).studentModel.password = p0;
                }),
              ),

              /// تأكيد كلمة المرور
              CustomTextFormField(
                label: 'تأكيد كلمة المرور',
                typeKeyBoard: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                obscureText: isObscureText,
                prefixIcon: const Icon(Icons.password),
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
                validator: (value)  {
                if (value == null || value.isEmpty) {
                  return   'الرجاء إدخال تأكيد كلمة المرور';
                }
                if (value != passwordController.text) {
                  return   'تأكيد كلمة المرور غير متطابق';
                }
                return  null;
                },onChanged: ((p0) {
                  OldStudentCubit.get(context).studentModel.confirmPassword = p0;
                }),
              ),



            ],
          ),
        ),
      ]),
    );
  
  });
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
