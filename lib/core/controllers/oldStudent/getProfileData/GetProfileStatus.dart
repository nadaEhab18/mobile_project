
import 'package:mobile_project/models/NewStudent/get_new_student_model.dart';

abstract class GetProfileStatus{}
class GetProInitState extends GetProfileStatus{}
class LoadingDataProfile extends GetProfileStatus{}
class ErrorGetDataProfile extends GetProfileStatus{}

class LoadingNewDataProfile extends GetProfileStatus{}
class DoneGetNewDataProfile extends GetProfileStatus{
  final StudentData? newStudents ;
  DoneGetNewDataProfile(this.newStudents);
}
class gpaDone extends GetProfileStatus{}

class ErrorGetNewDataProfile extends GetProfileStatus{}


