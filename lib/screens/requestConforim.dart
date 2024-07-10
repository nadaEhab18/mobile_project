import 'package:flutter/material.dart';
import 'package:mobile_project/network/remote/cache_helper.dart';

import '../widgets/customTextFormField.dart';

class RequestConfirm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const RequestConfirm({Key? key, required this.formKey}) : super(key: key);

  @override
  State<RequestConfirm> createState() => _RequestConfirmState();
}

TextEditingController noneController = TextEditingController();

class _RequestConfirmState extends State<RequestConfirm> {
  bool checkState = false ;

  @override
  Widget build(BuildContext context) {
  CacheHelper.saveData(key: "context", value: noneController.text);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 120),
            child: Image.asset('assets/images/helwanLogo.png',
              // height: 400,
            ),
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffac8600),
                      width: 5,),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ملاحظات هامة',style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                        TextConfirmRequest(text: '*  التقدم للمدن الجامعية من خلال استمارة التقديم الالكترونى مجانى بالكامل',),
                        TextConfirmRequest(text: '*   يجب الاحتفاظ بكلمة المرور لأهميتها فى تعديل بياناتك كما سيتم استخدامها لاحقا عند إقامتك بالمدينة'),
                        TextConfirmRequest(text: '*   لوحظ أن العديد من الطلاب يختارون السكن المميز ويجب الإشارة بأن السكن المميز له تكلفة عالية بالنسبة للسكن العادى'),
                        TextConfirmRequest(text: '*   يجب اختيار الجامعه والنوع (ذكر/ انثى) لتظهر انواع السكن المميز'),
                        TextConfirmRequest(text: '*   ذوى الاحتياجات الخاصة لا يدخل فى التنسيق'),

                      ],
                    ),
                  )
              ),
              SizedBox(height: 15,),
                const Text('أقر بأن البيانات (محل الإقامة - التقدير - الفرقة/الكلية) صحيحة طبقاً للأوراق الرسمية على أن أقدم هذه الأوراق عند حضوري للمدينة في حالة القبول وإذا ثبت أي خطأ في البيانات يتم تحويلي للشئون القانونية وفصلي نهائياً من المدينة'),
             Form(
               key: widget.formKey,
               child:CustomTextFormField(
               label: ' موافق',
               typeKeyBoard: TextInputType.text,
               prefixIcon: Icon(Icons.person),
               controller: noneController,
                validator: (value) {
                 if (value == null) {
                   return   'اكتب موافق؟ ';

                 }else{
                   return   null;
                 }
               },
             ), )

            ],
          ),
        ],
      )
    )
      ;
  }
}

class TextConfirmRequest extends StatelessWidget {
  final String text ;
  const TextConfirmRequest({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 19,
      ),
    );
  }
}
