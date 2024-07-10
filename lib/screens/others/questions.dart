import 'package:flutter/material.dart';
import 'package:mobile_project/widgets/drower.dart';

import '../../widgets/customQuestion.dart';


class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

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
        title: const Text(
          'الاسئلة الشائعة',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Color(0xffac8600),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: home_drawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomQuestion(
              question: 'هل يوجد استضافة للولاد ؟',
              answer: 'لا يوجد .',
            ),
            CustomQuestion(
              question: 'هل يوجد استضافة للبنات ؟',
              answer:
                  "نعم يوجد و تكون بأجر لمن لم يتم موافقة سكنه و بدون لجر لمن تم موافقة سكنه .",
            ),
            CustomQuestion(
              question: "عدد الاشخاص فى الحجرة الواحدة ؟",
              answer: "ثلاثة أشخاص .",
            ),
            CustomQuestion(
              question: "ما هى مبانى الولاد ؟",
              answer: "المبانى فردية الارقام مثل : 1 و 3 و 5 و 9 .",
            ),
            CustomQuestion(
              question: "ما هى مبانى البنات ؟",
              answer: "المبانى زوجية الارقام مثل :2 و 4و 12 و 18 .",
            ),
            CustomQuestion(
              question: "هل يوجد سكن مميز ؟",
              answer: "نعم يوجد .",
            ),
            CustomQuestion(
              question: "كم تكلفة السكن فى الشهر الواحد ؟",
              answer:
                  " 500 جنيه للطالب السكن بتغذية و 350 جنيه للطالب الساكن بدون تغذية .",
            ),
          ],
        ),
      ),
    );
  }
}

