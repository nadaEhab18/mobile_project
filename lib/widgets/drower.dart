

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/others/Constraints.dart';
import '../screens/others/RequestResult.dart';
import '../screens/others/loginPage.dart';
import '../screens/others/questions.dart';
import '../screens/others/requestTime.dart';
import '../screens/requestType.dart';

class home_drawer extends StatelessWidget {
  const home_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    //Box testBox = Hive.box("testBox");
    //final localize = AppLocalizations.of(context);
    return Directionality(textDirection: TextDirection.rtl, child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin:  EdgeInsets.only(bottom: 20.0,top: 20),
            padding : const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            decoration: BoxDecoration(
              //color: Theme.of(context).colorScheme.secondary
              color: Color(0xff003c70),
            ),
            child:
            Image.asset(
              'assets/images/logot.png',

            ),

          ),

          DrawerItem(
            tapFunction: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RequestTime();
                      }
                  )

              );
            },
            icon: Icons.calendar_month,
            titleItem: 'مواعيد التقديم للمدينة',
          ),
          DrawerItem(
            tapFunction: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RequestResult();
                      }
                  )
              );
            },
            icon: Icons.question_mark_outlined,
            titleItem: 'الاستعلام عن القبول',
          ),
          DrawerItem(
            tapFunction: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Constraints();
                      }
                  )
              );
            },
            icon: Icons.info_outlined,
            titleItem: 'ارشادرات التقدم و الاقرارات',
          ),
          DrawerItem(
            tapFunction: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Questions();
                      }
                  )
              );
            }
            ,
            icon: Icons.question_answer_rounded,
            titleItem: 'الأسئلة الشائعة',
          ),
          DrawerItem(
            tapFunction: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return login();
                      }

                  ),(route) => false);



            },
            icon: Icons.person_add_alt_1,
            titleItem: 'تسجيل الخروج',
          ),


        ],
      ),
    ));
      ;
  }
}

typedef onTapFunc = void Function()?;

class DrawerItem extends StatelessWidget {
  final onTapFunc tapFunction;
  final IconData icon;
  final String titleItem;

  const DrawerItem({
    super.key,
    this.tapFunction,
    required this.icon,
    required this.titleItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapFunction,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              titleItem,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}