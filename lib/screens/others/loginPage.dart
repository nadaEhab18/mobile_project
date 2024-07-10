import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/others/login/login_cubit.dart';
import 'package:mobile_project/core/controllers/others/login/login_status.dart';
import 'package:mobile_project/screens/others/loginDrawer.dart';
import 'package:mobile_project/screens/others/profile.dart';
import 'package:mobile_project/screens/requestType.dart';


import '../../core/controllers/oldStudent/getProfileData/GetProfileStatus.dart';
import '../../core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import '../../core/controllers/oldStudent/upDate/update_cubit.dart';
import '../../widgets/drower.dart';
import '../go.dart';
import '../home.dart';


class login extends StatefulWidget {
  login({super.key});
  static String routeName = 'Login';

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHieght(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  var nationalIdController = TextEditingController();

  var passwordController = TextEditingController();
  bool isObscureText = true;


  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    const Color primaryColor =   Color(0xff003c70);
    const Color secondaryColor =  Color(0xffac8600);
    return BlocConsumer<LoginCubit , LoginStates>(listener: (contxt , state ){

    } , builder: (context , state) {
    return BlocConsumer<GetProfileCubit , GetProfileStatus>(listener: (contxt , state ){

    } , builder: (context , state) {

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff003c70),
        elevation: 0,
      ),
      endDrawer: loginDrawer(),
      backgroundColor: const Color(0xff003c70),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /2.2,
            width: MediaQuery.of(context).size.width,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  "assets/images/logoWhite.png",
                  height: 270,
                  width: 270,
                  // fit: BoxFit.fitWidth,
                ),

                const SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child:Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    ///الرقم القومى
                    Container(
                      width: 350,
                      child: TextFormField(
                        controller: nationalIdController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey[500]!),
                          ),
                          prefixIcon:
                          Icon(Icons.co_present),
                          hintText: "الرقم القومى",

                          contentPadding:
                          const EdgeInsets.all(16),
                        ),
                        keyboardType:
                        TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال الرقم القومي';
                          }
                          if (value.length != 14) {
                            return 'الرجاء إدخال الرقم القومي كامل';
                          }
                          return null;
                        },
                        onTap: () {},
                        onTapOutside: (event) {
                          FocusScope.of(context)
                              .unfocus();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///كلمة المرور
                    Container(
                        width: 350,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: const Icon(
                                Icons.password,
                                color: Colors.black),
                           // obscureText: isObscureText,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                },);
                              },

                              icon: isObscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),

                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey[500]!),
                            ),
                            hintText: "كلمة المرور",
                            hintStyle: const TextStyle(
                                color: Colors.grey),
                            // labelText: "nationalID",
                            //labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding:
                            const EdgeInsets.all(16),
                          ),
                          keyboardType:
                          TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال كلمة المرور';
                            }
                            if (value.length != 14) {
                              return 'الرجاء إدخال الرقم القومي كامل';
                            }
                            return null;
                          },
                          onTap: () {},
                          onTapOutside: (event) {
                            FocusScope.of(context)
                                .unfocus();
                          },
                        )),

                    const SizedBox(
                      height: 20,
                    ),

                    /// button تسجيل الدخول
                    Container(
                      width: 280,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              getDataFoeProfile(context,nationalIdController.text , passwordController.text);

                            }},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                return primaryColor; // Set your desired color here
                              },
                            ),
                          ),
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    /// button تقديم طلب الالتحاق
                    Container(
                      width: 280,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const RequestType()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              return secondaryColor; // Set your desired color here
                            },
                          ),
                        ),
                        child: const Text(
                          "تقديم طلب الالتحاق",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              )


            ),
          ),

        ],
      ),


    );
  });});
}

}

getDataFoeProfile(BuildContext context, String email, String password) async {
  final res = await LoginCubit.get(context).userLogin(email: email, password: password);
  if (res == 404) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
         content: Text("الرجاء التاكد من اسم المستخدم و الباسورد مطابقين للرقم القومى "),
         duration: Duration(seconds: 3),
         backgroundColor: Colors.blue,
       ),
     );}
    else if(res == 200){
    final dataRes = await GetProfileCubit.get(context).GetStudentData(context);
    if(dataRes!= null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Replace with your actual route
      );
  }

    }

  }

