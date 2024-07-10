
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/others/studentResult/stuRes_cubit.dart';
import 'package:mobile_project/widgets/drower.dart';

import '../../core/controllers/others/studentResult/studentResStatus.dart';


class RequestResult extends StatefulWidget {
  const RequestResult({Key? key}) : super(key: key);

  @override
  State<RequestResult> createState() => _RequestResultState();
}

class _RequestResultState extends State<RequestResult> {
  TextEditingController viewResultController = TextEditingController();
  Color secondaryColor = Color(0xffac8600);

  // List<Map<String, dynamic>> _filteredData = [];
  bool _showDataTable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xffac8600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Color(0xffac8600)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff093c71),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الاستعلام عن القبول',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Color(0xffac8600),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
        endDrawer: home_drawer(),
        body: BlocListener<StudentResCubit, StudentResStatus>(
        listener: (context, state) {
          if(  state is GetResultSuccess ){
            setState(() {
              _showDataTable = true ;
            });}},

       child: Stack(alignment: AlignmentDirectional.center, children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 120),
            child: Image.asset(
              //'assets/images/helwanLogo.png',
              'assets/images/helwanLogoo.png',
              //'assets/images/hLogo.png'
              // height: 400,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                label: 'الرقم القومي',
                typeKeyBoard: TextInputType.number,
                prefixIcon: Icon(Icons.perm_contact_cal_rounded),
                controller: viewResultController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء إدخال الرقم القومي';
                  }
                  if (value.length != 14) {
                    return 'الرجاء إدخال الرقم القومي كامل';
                  }
                  return null;
                },
                showInput: () {
                  print('nationalId : ${viewResultController.text}');
                },
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                width: 280,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    StudentResCubit.get(context)
                        .showResult(email: viewResultController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return secondaryColor; // Set your desired color here
                      },
                    ),
                  ),
                  child: const Text(
                    "استعلام",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _showDataTable ?
                           Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: BlocBuilder<StudentResCubit, StudentResStatus>(
                      builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text:  TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'الاسم : ' , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              TextSpan(
                                text:'${StudentResCubit.get(context).data!.result[0]!.name!}' ,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              ),

                            ],
                          ),
                        ),
                        RichText(
                          text:  TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'الرقم القومى : ' , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              TextSpan(
                                text:'${StudentResCubit.get(context).data!.result[0]!.nationalId!}' ,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              ),

                            ],
                          ),
                        ),
                        RichText(
                          text:  TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'الكلية :' , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              TextSpan(
                                text:'${StudentResCubit.get(context).data!.result[0]!.collegeName!}' ,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              ),

                            ],
                          ),
                        ),
                        RichText(
                          text:  TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'النتيجة: ' , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              TextSpan(
                                text:'${StudentResCubit.get(context).data!.message!}' ,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              ),

                            ],
                          ),
                        ),
                      ],
                    );
                      }))
                  :SizedBox(height: 100,)
            ],
          ),
        ],)
       )
    );
  }
}

typedef Validation = String? Function(String?)?;
typedef ShowBirthday = Function()?;
typedef OnEditingComplete = void Function()?;

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Validation validator;
  final ShowBirthday birthday;
  final OnEditingComplete showInput;

  final TextInputType? typeKeyBoard;

  final bool obscureText;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.typeKeyBoard,
    this.obscureText = false,
    this.suffixIcon,
    this.birthday,
    this.showInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          textDirection: TextDirection.rtl,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(),
            labelText: label,
          ),
          keyboardType: typeKeyBoard,
          validator: validator,
          obscureText: obscureText,
          onTap: birthday,
          onEditingComplete: showInput,
        ),
      ),
    );
  }
}
