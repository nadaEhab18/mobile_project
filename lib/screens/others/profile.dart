import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/screens/others/updateProfile.dart';
import 'package:mobile_project/widgets/drower.dart';


import '../../core/controllers/oldStudent/getProfileData/GetProfileStatus.dart';
import '../../core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
bool _rebuildPage = false ;
String? gender;
String?religon;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit ,GetProfileStatus >( listener:(context , state){} ,builder:(context , state){
    var  getProfileData = GetProfileCubit.get(context) ;
    if(getProfileData.newStudents!.student.eygptian ==1){
      gender = "مصرى";
    }else{
      gender == "وافد";
    }
    if(getProfileData.newStudents!.student.religion =="muslim"){
      religon= "مسلم";
    }else{
      religon= "مسيحي";
    }
      return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xffac8600),
            ),
            backgroundColor: Color(0xff003c70),
            title: Text('بيانات الطالب',style: TextStyle(color:Color(0xffac8600),fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          endDrawer: home_drawer(),
          body: Column(
              children: [
                Padding(padding: const EdgeInsets.only(left: 270 , top: 10, bottom: 20),
                    child:CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child:ClipOval(child:  GetProfileCubit.get(context).newStudents!.student.gender=='Male'?  Image.asset(
                        'assets/images/mm-removebg-preview.png',
                      ): Image.asset(
                        'assets/images/ff-removebg-preview.png',
                      ),)
                      ,)),
               Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  Card(
                    color: Colors.grey.shade50,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: RichText(
                        text:  TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.black ,fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: 'اسم  : ' , style: TextStyle(color:Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:'${getProfileData.newStudents!.student.name}' ,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                            ),

                          ],
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'اسم الاب : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.fatherName}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الرقم القومى : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${getProfileData.newStudents!.student.nationalID}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),

                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الديانة : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${religon}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),
                          RichText(
                            text:  TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'الجنسية : ' , style: TextStyle(color: Color(0xffac8600),fontSize: 16,fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text:'${gender}' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff003c70)),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ) ,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff003c70)

                  ),
                  width: 300,
                  height: 40,
                  child:ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffac8600)),

                      ),
                      child: const Text("التعديل على المعلومات  الشخصية ",
                      ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateStudentProfile()));}

                    // details.onStepContinue,
                  ) ,),
                SizedBox(height: 100,)

              ]
          )
      );
    } );


  }
}