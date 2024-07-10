import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/controllers/newStudent/request_form_controller/new_student_cubit.dart';
import 'package:mobile_project/core/controllers/observer.dart';
import 'package:mobile_project/core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import 'package:mobile_project/core/controllers/oldStudent/request_form_controller/old_student_cubit.dart';
import 'package:mobile_project/core/controllers/oldStudent/upDate/update_cubit.dart';
import 'package:mobile_project/core/controllers/others/constrain/constrainCubit.dart';
import 'package:mobile_project/core/controllers/others/login/login_cubit.dart';
import 'package:mobile_project/core/controllers/others/studentResult/stuRes_cubit.dart';
import 'package:mobile_project/network/remote/cache_helper.dart';
import 'package:mobile_project/network/remote/dio_file.dart';
import 'package:mobile_project/screens/others/splashScreen.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver() ;
  runApp( MyApp());


}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
          providers: [
            BlocProvider(create:(context)=>OldStudentCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>NewStudentCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>ConstraintCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>LoginCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>GetProfileCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>UpdateCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>StudentResCubit(),
              lazy: true,)

          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              home://RequestConfirm(),
              //  RequestTime(),
              // RequestType(),
              //    StudentProfile()
              // RequestForm(),
              //  Questions(),

              // RequestResult()
              //  login()
              //   StudentProfile()
              SplashScreen()
          ));
  }
}
