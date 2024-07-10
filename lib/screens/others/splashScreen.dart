import 'package:flutter/material.dart';
import 'loginPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),() async => Navigator.push(context, MaterialPageRoute(
        builder: (context)  =>  login())));




    return Scaffold(
      backgroundColor: Color(0xff003c70),
      body: Center(
        child: Image.asset(
          'assets/images/logoWhite.png',
        ),
      ),
    );
  }
}
/*GetData(context)async{
  if(nationalId !="" ){
    final resee = await GetProfileCubit.get(context).GetOldStudentData();
    if(resee != null){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)  =>  Profile()));
    }
  }else{
    Navigator.push(context, MaterialPageRoute(
        builder: (context)  =>  login()));
  }

}
*/