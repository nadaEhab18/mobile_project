import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/others/constrain/constrainCubit.dart';


import '../../core/controllers/others/constrain/constraint_status.dart';
import '../../widgets/drower.dart';

class Constraints extends StatelessWidget {
  const Constraints({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConstraintCubit(),
      child: BlocConsumer<ConstraintCubit, ConstraintStatues>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            ConstraintCubit cubit = ConstraintCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Color(0xffac8600),
                ),

                elevation: 0,
                backgroundColor: Color(0xff003c70),
                centerTitle: true,
                title:
                Text('إرشادات التقدم',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Color(0xffac8600),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),

              ),
              endDrawer: const home_drawer(),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child:   Column(children: [
                  Expanded(
                    //flex: 5,
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 400,
                              width: 70,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              decoration: const BoxDecoration(
                                  color: Color(0xff003c70),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12))),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          cubit.constraint();
                                        },
                                        child: Transform.rotate(
                                          angle: 0,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: const Icon(Icons.looks_one_rounded,color: Color(0xffac8600),size: 35,)
                                            /*  const Text(
                                                  '1'
                                                  //"خطوات التقديم "
                                                      ,
                                                  style: TextStyle(
                                                      color: Color(0xffac8600),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),*/
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          cubit.changeTextOldStudent();
                                        },
                                        child: Transform.rotate(
                                          angle: 0,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: const Icon(Icons.looks_two_rounded,color: Color(0xffac8600),size: 32,)

                                            /* Text(
                                                  '2',
                                                    //"اوراق طالب قديم ",
                                                    style: TextStyle(
                                                        color: Color(0xffac8600),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)), */
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // flex: 1,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          cubit.ChangeToNewStudent();
                                        },
                                        child: Transform.rotate(
                                          angle: 0,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: const Icon(Icons.looks_3_rounded,color: Color(0xffac8600),size: 35,)
                                            /* Text(
                                                  '3',
                                                  //  "اوراق طالب مستجد",
                                                    style: TextStyle(
                                                        color: Color(0xffac8600),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)), */
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),),
                      Expanded(
                        flex: 8,
                        child: Column(children: [
                          SizedBox(
                            height: 40,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 120),
                                child: Image.asset(
                                  //'assets/images/helwanLogo.png',
                                  'assets/images/helwanLogoo.png',
                                  //'assets/images/hLogo.png'
                                  // height: 400,
                                ),
                              ),
                              /* Image.asset('asset/images/helwanLogo.png',
                                  height: 300,
                                    width: 150,
                                  ),
                                  */
                              Container(
                                  width: double.infinity,
                                  height: 670,
                                  padding: EdgeInsets.all(11),
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    // color: Color(0xffac8600),

                                      border: Border.all(
                                        color: Color(0xffac8600),
                                        width: 3,),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),)
                                  ),

                                  child: SingleChildScrollView(
                                    child:
                                    RichText(
                                      text:
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 17.8,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(text: '${cubit.textTitle}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Color(0xffac8600),
                                            ),),

                                          // TextSpan(text: '١ - '),
                                          TextSpan(
                                            text: '${cubit.text1}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          // TextSpan(text: '٢ - '),
                                          TextSpan(
                                            text: '${cubit.text2}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          // TextSpan(text: '٣ - '),
                                          TextSpan(
                                            text: '${cubit.text3}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          // TextSpan(text: '٤ - '),
                                          TextSpan(
                                            text: '${cubit.text4}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          // TextSpan(text: '٥ - '),
                                          TextSpan(
                                            text: '${cubit.text5}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          // TextSpan(text: '٦ - '),
                                          TextSpan(
                                            text: '${cubit.text6}\n',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),


                                    ),


                                    //    ],
                                    //  ),
                                  )),

                            ],
                          ),
                        ],),),
                    ],),),
                ],),
              )


         /*     Column(children: [
                Expanded(
                  //flex: 5,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 400,
                            width: 70,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                                color: Color(0xff003c70),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    topLeft: Radius.circular(12))),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.constraint();
                                      },
                                      child: Transform.rotate(
                                        angle: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Icon(Icons.looks_one_rounded,color: Color(0xffac8600),size: 35,)
                                          /*  const Text(
                                                  '1'
                                                  //"خطوات التقديم "
                                                      ,
                                                  style: TextStyle(
                                                      color: Color(0xffac8600),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),*/
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.changeTextOldStudent();
                                      },
                                      child: Transform.rotate(
                                        angle: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Icon(Icons.looks_two_rounded,color: Color(0xffac8600),size: 32,)

                                          /* Text(
                                                  '2',
                                                    //"اوراق طالب قديم ",
                                                    style: TextStyle(
                                                        color: Color(0xffac8600),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)), */
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  // flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.ChangeToNewStudent();
                                      },
                                      child: Transform.rotate(
                                        angle: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Icon(Icons.looks_3_rounded,color: Color(0xffac8600),size: 35,)
                                          /* Text(
                                                  '3',
                                                  //  "اوراق طالب مستجد",
                                                    style: TextStyle(
                                                        color: Color(0xffac8600),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)), */
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),),
                    Expanded(
                      flex: 8,
                      child: Column(children: [
                        SizedBox(
                          height: 40,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 120),
                              child: Image.asset(
                                //'assets/images/helwanLogo.png',
                                'assets/images/helwanLogoo.png',
                                //'assets/images/hLogo.png'
                                // height: 400,
                              ),
                            ),
                            /* Image.asset('asset/images/helwanLogo.png',
                                  height: 300,
                                    width: 150,
                                  ),
                                  */
                            Container(
                                width: double.infinity,
                                height: 622,
                                padding: EdgeInsets.all(11),
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  // color: Color(0xffac8600),

                                    border: Border.all(
                                      color: Color(0xffac8600),
                                      width: 3,),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),)
                                ),

                                child: SingleChildScrollView(
                                  child:
                                  RichText(
                                    text:
                                    TextSpan(
                                      style: TextStyle(
                                        fontSize: 17.8,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(text: '${cubit.textTitle}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Color(0xffac8600),
                                          ),),

                                        // TextSpan(text: '١ - '),
                                        TextSpan(
                                          text: '${cubit.text1}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        // TextSpan(text: '٢ - '),
                                        TextSpan(
                                          text: '${cubit.text2}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        // TextSpan(text: '٣ - '),
                                        TextSpan(
                                          text: '${cubit.text3}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        // TextSpan(text: '٤ - '),
                                        TextSpan(
                                          text: '${cubit.text4}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        // TextSpan(text: '٥ - '),
                                        TextSpan(
                                          text: '${cubit.text5}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        // TextSpan(text: '٦ - '),
                                        TextSpan(
                                          text: '${cubit.text6}\n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),


                                  ),


                                  //    ],
                                  //  ),
                                )),

                          ],
                        ),
                      ],),),
                  ],),),
              ],),*/
            )
            ;
          }),
    );
  }
}