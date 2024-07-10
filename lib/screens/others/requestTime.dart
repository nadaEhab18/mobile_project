import 'package:flutter/material.dart';
import 'package:mobile_project/widgets/drower.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RequestTime extends StatelessWidget {
  const RequestTime({Key? key}) : super(key: key);

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
        centerTitle: true,
        backgroundColor: Color(0xff003c70),
        title: const Text('مواعيد التقديم',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xffac8600),
            decoration: TextDecoration.none, // Remove underline

          ),
        ),

      ),
        endDrawer: home_drawer(),
        body:Stack(
          alignment: AlignmentDirectional.center,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 120),
              child: Image.asset(
                //'assets/images/helwanLogo.png',
                'assets/images/helwanLogoo.png',
                //'assets/images/hLogo.png'
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    /// start timeLine
                    MyTimeLine(isFirst: true, isLast: false, isPast: true, icon: Icons.person,
                      richText:
                      Padding(
                        // padding: const EdgeInsets.symmetric(horizontal: 15.0,),
                        padding: const EdgeInsets.all(8.0),
                        child:
                        RichText(
                          text:
                          TextSpan(
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: ' الطلاب القدامى :\n\n',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xffac8600),
                                ),),

                              TextSpan(
                                text: 'من 1/8/2023 الى 20/9/2023\n',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),
                              ),

                            ],
                          ),


                        ),
                      ),


                    ),


                    /// end timeLine
                    MyTimeLine(isFirst: false, isLast: true, isPast: false,icon: Icons.person_add_alt_1_rounded,richText:
                    Padding(
                      // padding: const EdgeInsets.symmetric(horizontal: 15.0,),
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text:
                        TextSpan(
                          style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'الطلاب الجدد :\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xffac8600),
                              ),),

                            TextSpan(
                              text: 'من 1/8/2023 الى 20/9/2023\n',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),
                            ),

                          ],
                        ),


                      ),


                    ),),

                  ],
                ),
              ),
            ),


          ]
      )
     /* Container(
        color: Colors.white,
        child: Column(

          children: [
            /// slider
            // Container(
            //   child: CarouselSlider.builder(
            //       itemCount: 3,
            //       options: CarouselOptions(
            //         height: 200,
            //         autoPlay: true,
            //         autoPlayInterval: Duration(seconds: 3),
            //         enableInfiniteScroll: true,
            //       ),
            //       itemBuilder: (BuildContext context, int itemIndex,
            //           int pageViewIndex) {
            //         return Container(
            //           padding: EdgeInsets.all(10),
            //           width: 300,
            //           // height: 400,
            //           child: Image.asset(
            //             'assets/images/$itemIndex.jpeg',
            //             width: MediaQuery.of(context).size.width,
            //           ),
            //         );
            //       }),
            // ),

            Stack(
              // alignment: AlignmentDirectional.center,
              children:
        [
           Padding(
             padding: const EdgeInsets.all(80.0),
             child: Image.asset('assets/images/helwanLogo.png',
             // height: 400,
             ),
           ),
          Container(
            height: 200,
            width: 350,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.blueGrey.shade100,
            ),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('*  الطلاب القدامى :',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('من 1/8/2023 الى 20/9/2023',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text('*  الطلاب القدامى :',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('من 1/8/2023 الى 20/9/2023',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ],
              ),
            ),
          ),

        ]
            ),





          ],



        ),
      ),*/
    )
    ;
  }
}


class MyTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final IconData icon;
  final Widget richText ;

  const MyTimeLine({Key? key, required this.isFirst, required this.isLast, required this.isPast, required this.icon, required this.richText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,

        /// decorate lines
        beforeLineStyle: LineStyle(
          color:Color(0xff093c71),
        ),


        /// decorate icons
        indicatorStyle: IndicatorStyle(
            width: 50,
            color:Color(0xff093c71),
            iconStyle: IconStyle(
              iconData: icon,
              color: Color(0xffac8600),
              fontSize: 21,
            )
        ),

        endChild:
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          decoration: BoxDecoration(
            // color: Colors.white,
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffDDDDDD),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(
                        0.0,0.0
                    )
                ),
              ]
          ),
          child:  SingleChildScrollView(
            child: richText,
          ),
        ),
      ),

    ) ;
  }
}


 