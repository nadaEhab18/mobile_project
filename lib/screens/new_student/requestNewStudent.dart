import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/controllers/newStudent/request_form_controller/new_student_cubit.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/customTextLabel.dart';



class NewStudentInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const NewStudentInfo({Key? key, required this.formKey}) : super(key: key);

  @override
  State<NewStudentInfo> createState() => _NewStudentInfoState();
}

class _NewStudentInfoState extends State<NewStudentInfo> {
  int? newSelected;
  String? newDropValue;
  String? newDropreligion;


  TextEditingController newNationalIdController = TextEditingController();
  TextEditingController newCodeController = TextEditingController();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newAddressController = TextEditingController();
  TextEditingController newBirthdateController = TextEditingController();
  TextEditingController newPhoneController = TextEditingController();
  TextEditingController newMobileController = TextEditingController();

  String? newDropGovernorate ;
  List<String> governorates = [
    "القاهرة", //1
    "الجيزة", //2
    "الاسكندرية", //3
    "الدقهلية", //4
    "البحر الاحمر", //5
    "البحيرة",  //6
    "الفيوم", //7
    "الغربية", //8
    "الاسماعلية", //9
    "المنوفية", //10
    "المنيا", //11
    "القليوبية", //12
    "الوادى الجديد",  //13
    "السويس",  //14
    "اسوان",  //15
    "اسيوط",  //16
    "بنى سويف",  //17
    "بورسعيد",  //18
    "دمياط",  //19
    "الشرقية",  //20
    "جنوب سيناء",  //21
    "كفرالشيخ", //22
    "مطروح",  //23
    "الاقصر",  //24
    "قنا",  //25
    "شمال سيناء",  //26
    "سوهاج",  //27


  ];
  int? newSelectedGovernorate;
  int? newSelectedCity;

  List<Map<String, dynamic>> getCities(int governorateId) {
   return city
        .firstWhere((element) => element['governorate_id'] == governorateId)['cities'];
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.loose,
        children: [
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

                /// نوع الطالب
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      children: [
                        const TextLabel(
                          textLabel: 'مصرى',
                        ),
                        Radio(
                          groupValue:newSelected,
                          value: 1, // مصرى,
                          onChanged: (int? newValue) async {
                            setState(() {
                              newSelected = newValue ;
                              NewStudentCubit.get(context).new_student.eygptian = newSelected ;
                            });

                          },
                        ),
                        TextLabel(
                          textLabel: 'وافد',
                        ),
                        Radio(
                            value: 0, //وافد
                            groupValue: newSelected,
                            onChanged: (int? newValue) {
                              setState(() {
                                newSelected = newValue ;
                                NewStudentCubit.get(context).new_student.eygptian=newSelected;
                              }
                              );})
                      ],
                    ),
                  ),
                ),

                /// الاسم
                CustomTextFormField(
                  label: ' الاسم رباعى باللغة العربية',
                  typeKeyBoard: TextInputType.text,
                  prefixIcon: Icon(Icons.person),
                  controller: newNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال الاسم رباعى ';
                    }
                    if (value.length < 10) {
                      return 'الرجاء إدخال الاسم رباعى كامل';
                    }
                    return null;
                  },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.name  = p0 ;
                  },

                  showInput: (){
                    print('studentName : ${newNameController.text}');
                  },

                ),

                /// الرقم القومى
                CustomTextFormField(
                  label: 'الرقم القومي',
                  typeKeyBoard: TextInputType.number,
                  prefixIcon: Icon(Icons.perm_contact_cal_rounded),
                  controller: newNationalIdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال الرقم القومي';
                    }
                    if (value.length != 14) {
                      return 'الرجاء إدخال الرقم القومي كامل';
                    }
                    return null;
                  },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.nationalID  = p0 ;
                  },

                  showInput: (){
                    print('nationalId : ${newNationalIdController.text}');
                  },
                ),

                /// كود الطالب
                CustomTextFormField(
                  label: 'كود الطالب',
                  typeKeyBoard: TextInputType.number,
                  prefixIcon: Icon(Icons.co_present),
                  controller: newCodeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال كود الطالب';
                    }
                    if (value.length != 11) {
                      return 'الرجاء إدخال كود الطالب كامل';
                    }
                    return null;
                  },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.studentCode  = p0 ;
                  },

                  showInput: (){
                    print('studentCode : ${newCodeController.text}');
                  },
                ),

                /// تاريخ الميلاد
                CustomTextFormField(
                  label: 'تاريخ الميلاد',
                  controller: newBirthdateController,
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                  birthday: () {
                    _selectDate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال تاريخ الميلاد';
                    }
                    return null;
                  },

                  showInput: () {
                    print('birthday : ${newBirthdateController.text}');
                  },
                ),

                /// النوع
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label:Text('النوع'),
                      prefixIcon: Icon(Icons.how_to_reg),
                      border: InputBorder.none,
                    ),
                    //  hint:Text('النوع'),
                    validator: (value) {
                      if (value == null || (value as String).isEmpty) {
                        return 'الرجاء اختيار النوع';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        newDropValue = val as String;
                          NewStudentCubit.get(context).new_student.gender  = newDropValue ;

                        print('gender : $newDropValue');
                      });
                    },
                    value: newDropValue,
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        child: Text('ذكر'),
                        value: 'Male',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('أنثى'),
                        value: 'Female',
                      ),
                    ],


                  ),
                ),


                /// الديانة
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
                      label:Text('الديانة'),
                      prefixIcon: Icon(Icons.yard),
                      border: InputBorder.none,
                    ),
                    // hint:Text('الديانة'),
                    onChanged: (val) {
                      setState(() {
                        newDropreligion = val as String;
                          NewStudentCubit.get(context).new_student.religion  = newDropreligion ;
                        print('religion : $newDropreligion');
                      });
                    },
                    validator: (value) {
                      if (value == null || (value as String).isEmpty) {
                        return 'الرجاء اختيار الديانة';
                      }
                      return null;
                    },

                    value: newDropreligion,
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        child: Text('مسلم'),
                        value: 'muslim',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('مسيحي'),
                        value: 'christian',
                      ),
                    ],

                  ),
                ),

                /// محل الاقامة
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
                      label: Text('المحافظة'),
                      prefixIcon: Icon(Icons.yard),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) async {
                      setState(() {
                        newSelectedGovernorate = val;
                        newSelectedCity = null; // Reset selected city when governorate changes.
                        NewStudentCubit.get(context).new_student.governorateId = newSelectedGovernorate ;
                        print("Governorate : $newSelectedGovernorate");
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'الرجاء اختيار المحافظة';
                      }
                      return null;
                    },
                    value: newSelectedGovernorate,
                    items: governorates
                        .asMap()
                        .map((index, value) {
                      int governorateValue = index + 1;
                      return MapEntry(
                        index,
                        DropdownMenuItem<int>(
                          child: Text(value),
                          value: governorateValue,
                        ),
                      );
                    })
                        .values
                        .toList(),
                  ),
                ),


                    ///المدينه
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
                      label: Text('المدينة'),
                      prefixIcon: Icon(Icons.location_city),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) async {
                      setState(() {
                        newSelectedCity = val;
                        NewStudentCubit.get(context).new_student.cityId = newSelectedCity ;
                        print(" city: $newSelectedCity");
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'الرجاء اختيار المدينة';
                      }
                      return null;
                    },
                    value: newSelectedCity,
                    items: newSelectedGovernorate != null
                        ? getCities(newSelectedGovernorate!)
                        .asMap()
                        .map((index, value) {
                      int cityValue = value['id'];
                      return MapEntry(
                        index,
                        DropdownMenuItem<int>(
                          child: Text(value['name']),
                          value: cityValue,
                        ),
                      );
                    })
                        .values
                        .toList()
                        : [], // Show empty list when no governorate is selected.
                  ),
                ),



                /// العنوان بالتفاصيل
                CustomTextFormField(
                  label: 'العنوان بالتفاصيل',
                  typeKeyBoard: TextInputType.text,
                  prefixIcon: Icon(Icons.account_balance),
                  controller: newAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال العنوان بالتفاصيل ';
                    }
                    if (value.length < 20) {
                      return 'الرجاء إدخال العنوان بالتفاصيل كامل';
                    }
                    return null;
                  },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.address  = p0 ;
                  },


                ),


                /// التلبفون
                CustomTextFormField(
                  label: 'التلبفون',
                  typeKeyBoard: TextInputType.phone,
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  controller: newPhoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال التلبفون ';
                    }
                    if (!value.contains('01')) {
                      return 'الرجاء إدخال التلبفون صح';
                    }
                    if (value.length != 11) {
                      return 'الرجاء إدخال التلبفون';
                    }
                    return null;
                  },
                  showInput: () {
                    print('phone : ${newPhoneController.text}');
                  },
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.  phoneNumber= p0 ;
                  },
                ),

                /// الموبيل
                CustomTextFormField(
                  label: 'الموبيل',
                  typeKeyBoard: TextInputType.phone,
                  prefixIcon: Icon(Icons.phone),
                  controller: newMobileController,
                  validator: (value) {
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
                  onChanged: (p0){
                    NewStudentCubit.get(context).new_student.mobileNumber  = p0 ;
                  },

                  showInput: () {
                    print('phone : ${newMobileController.text}');
                  },
                ),


              ],
            ),
          ),
        ],

      ),
    );
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
        newBirthdateController.text = _picker.toString().split(' ')[0];
          NewStudentCubit.get(context).new_student.birthDate  = newBirthdateController.text ;
      });
    }
  }

  List<Map<String, dynamic>> city = [
    {
      "governorate_id": 1,
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



}

