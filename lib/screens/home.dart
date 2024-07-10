import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_project/core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import 'package:mobile_project/screens/others/profile.dart';

import 'package:mobile_project/screens/others/questions.dart';
import 'package:mobile_project/screens/others/requestTime.dart';
import 'package:mobile_project/screens/requestType.dart';

import 'others/RequestResult.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003c70),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 6.5,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                       leading:
                      // CircleAvatar(
                      //   radius: 30,
                      //   child: ClipOval(
                      //     child: Container(
                      //         decoration: const BoxDecoration(
                      //             image: DecorationImage(
                      //                 image:
                       GetProfileCubit.get(context).newStudents!.student.gender=='Male'?  Image.asset(
                      'assets/images/mm-removebg-preview.png',
                    ): Image.asset(
                'assets/images/ff-removebg-preview.png',
              ),

                                     // fit: BoxFit.cover))),
                      //   ),
                      // ),
                      title: Text('${GetProfileCubit.get(context).newStudents!.student.name}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xffac8600)),),
                      subtitle: Text('${GetProfileCubit.get(context).newStudents!.student.nationalID}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                      trailing: IconButton(
                        icon: Icon(Icons.edit_note_rounded,size: 30,color:  Color(0xffac8600),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Profile();

                                  }
                              )

                          );
                        },
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   "assets/images/logoWhite.png",
                  //   height: 70,
                  //   width: 70,
                  // ),

                  // const SizedBox(
                  //   height: 10,
                  // ),

                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 18),
                      child: Row(
                        children: [
                    //
                          Category(
                            pass: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  RequestTime()
                                // const   RequestType()

                              ));
                            },
                            urlImage:
                                'assets/lottie/appointmenttt.json',
                            title: 'مواعيد التقديم',
                            // noCourses: '25 Courses',
                          ),

                          SizedBox(
                            width: 15,
                          ),
                          Category(
                            pass: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  RequestType()
                                // const   RequestType()

                              ));
                            },
                            urlImage:
                                'assets/lottie/requessst.json',
                           title: 'طلب الالتحاق',
                            // noCourses: '15 Courses',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //2 row
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                      child: Row(
                        children: [
                          //Column ==> image ==> text1 ==> text2
                          Category(
                            pass: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  RequestResult()
                                // const   RequestType()

                              ));
                            },
                            urlImage:
                                'assets/lottie/result.json',

                             title: 'استعلام النتيجة',
                            // noCourses: '20 Courses',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Category(
                            pass: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  Questions()
                                // const   RequestType()

                              ));
                            },
                            urlImage:
                            'assets/lottie/quesstion.json',
                            title: 'الأسئلة الشائعة',
                            // noCourses: '18 Courses',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),

              ),
            ),

          ],
        ),



    );
  }
}

typedef OnTap = void Function()? ;
class Category extends StatelessWidget {
  final String urlImage;
   final String title;
   final OnTap pass;
  // final String noCourses;

  const Category({
    Key? key,
    required this.urlImage,
     required this.title,required this.pass,
    // required this.noCourses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      height: 220,
      width: 170,
      child: GestureDetector(
        onTap: pass,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset(
                urlImage,
                height: 150,
                width: 150,
              ),
              margin: EdgeInsets.only(top: 10, left: 18),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Color(0xffac8600),fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

