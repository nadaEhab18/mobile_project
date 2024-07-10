
import 'package:flutter/material.dart';
import 'package:mobile_project/screens/requestNewStepper.dart';
import 'package:mobile_project/screens/requestStepper.dart';
import 'package:mobile_project/widgets/drower.dart';

import '../widgets/textTabBar.dart';

class RequestType extends StatefulWidget {
  const RequestType({Key? key}) : super(key: key);

  @override
  State<RequestType> createState() => _RequestTypeState();
}

class _RequestTypeState extends State<RequestType> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xffac8600),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: Color(0xffac8600)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Color(0xff003c70),
          centerTitle: true,
          title: const Text('تقديم طلب الالتحاق ',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Color(0xffac8600),
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none, // Remove underline
          ),
          ),
          bottom: const TabBar(

            indicatorColor: Color(0xffac8600),
            indicatorWeight: 8,
            labelColor: Color(0xffac8600),
            unselectedLabelColor : Colors.white,

            tabs: [
              Tab(
                child: TextTabBar(text:'الطلاب المستجدين',),
              ),
              Tab(
                child:
                TextTabBar(text:'الطلاب القدامى',),
              ),

            ],
          ),
        ),
        endDrawer: home_drawer(),
        //floatingActionButton: FloatingActionButton(onPressed: (){OldStudentCubit.get(context).submitOldStudent();}),
        body: const TabBarView(
         children: [
           RequestNewStepper(),  // القدامى
           RequestStepper(), // المستجدين


         ],

          ),
      ),
    );
  }
}

