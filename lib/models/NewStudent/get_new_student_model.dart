 import 'get_new_student2_model.dart';


// class NewStudents {
//   List<NewStudent>? newStudents;
//
//   NewStudents({this.newStudents});
//
//   factory NewStudents.fromJson(Map<String, dynamic> json) {
//     List<dynamic> studentList = json['student'];
//     List<NewStudent> newStudents = studentList.map((e) =>
//         NewStudent.fromJson(e)).toList();
//     return NewStudents(newStudents: newStudents);
//   }
//
// }
//

 // class NewStudents {
 //  List<newStudent>? newStudents;
 //
 //  NewStudents({this.newStudents});
 //
 //  factory NewStudents.fromJson(Map<String, dynamic> json) {
 //   if (json.containsKey('student')) {
 //    List<dynamic> studentData = json['student'];
 //    List<newStudent> newStudents = studentData
 //        .map((e) => newStudent.fromJson(e as Map<String, dynamic>))
 //        .toList();
 //    return NewStudents(newStudents: newStudents);
 //   } else {
 //    return NewStudents(newStudents: []);
 //   }
 //  }
 // }
 class StudentData {
  final String source;
  final StudentDetails student;

  StudentData({
   required this.source,
   required this.student,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
   return StudentData(
    source: json['source'],
    student: StudentDetails.fromJson(json['student']),
   );
  }
 }
 class StudentDetails {
  final int? id;
  final String name;
  final String email;
  final int eygptian;
  final String nationalID;
  final String studentCode;
  final String birthDate;
  final String gender;
  final String religion;
  final String phoneNumber;
  final String mobileNumber;
  final String fatherName;
  final String fatherNationalID;
  final String? fatherOccupation;
  final String fatherPhone;
  final String guardianName;
  final String guardianNationalID;
  final String parentsStatus;
  final String guardianPhoneNumber;
  final String guardianRelation;
  final String housingType;
  final int? successRate;
  final int housingWithoutCatering;
  final String? housingInPreviousYear;
  final int familyAbroad;
  final int specialNeed;
  final String password;
  final String confirmPassword;
  final int collegeId;
  final String? department;
  final int levelId;
  final int? gpaId;
  final int governorateId;
  final int cityId;
  final String address;
  final int? SecondaryEducationTotalScore;
  final int? SecondaryEducationRate;
  final int? SecondaryEducationAbroad;
  final String? SecondaryEducationDivision;
  final dynamic adminId;
  final dynamic employeeId;
  final dynamic buildingId;

  StudentDetails({
   required this.id,
   required this.name,
   required this.email,
   required this.eygptian,
   required this.nationalID,
   required this.studentCode,
   required this.birthDate,
   required this.gender,
   required this.religion,
   required this.phoneNumber,
   required this.mobileNumber,
   required this.fatherName,
   required this.fatherNationalID,
   this.fatherOccupation,
   required this.fatherPhone,
   required this.guardianName,
   required this.guardianNationalID,
   required this.parentsStatus,
   required this.guardianPhoneNumber,
   required this.guardianRelation,
   required this.housingType,
    this.successRate,
   required this.housingWithoutCatering,
   this.housingInPreviousYear,
   required this.familyAbroad,
   required this.specialNeed,
   required this.password,
   required this.confirmPassword,
   required this.collegeId,
    this.department,
   required this.levelId,
    this.gpaId,
   required this.governorateId,
   required this.cityId,
   required this.address,
   this.SecondaryEducationAbroad,
   this.SecondaryEducationDivision,
   this.SecondaryEducationRate,
   this.SecondaryEducationTotalScore,
   this.adminId,
   this.employeeId,
   this.buildingId,
  });

  factory StudentDetails.fromJson(Map<String, dynamic> json) {
   return StudentDetails(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    eygptian: json['Eygptian'],
    nationalID: json['nationalID'],
    studentCode: json['studentCode'],
    birthDate: json['birthDate'],
    gender: json['gender'],
    religion: json['religion'],
    phoneNumber: json['phoneNumber'],
    mobileNumber: json['mobileNumber'],
    fatherName: json['fatherName'],
    fatherNationalID: json['fatherNationalID'],
    fatherOccupation: json['fatherOccupation'],
    fatherPhone: json['fatherPhone'],
    guardianName: json['GuardianName'],
    guardianNationalID: json['GuardianNationalID'],
    parentsStatus: json['ParentsStatus'],
    guardianPhoneNumber: json['GuardianPhoneNumber'],
    guardianRelation: json['GuardianRelation'],
    housingType: json['HousingType'],
    successRate: json['successRate'],
    housingWithoutCatering: json['HousingWithoutCatering'],
    housingInPreviousYear: json['HousingInPreviousYear'],
    familyAbroad: json['FamilyAbroad'],
    specialNeed: json['SpecialNeed'],
    password: json['password'],
    confirmPassword: json['ConfirmPassword'],
    collegeId: json['college_id'],
    department: json['Department'],
    levelId: json['level_id'],
    gpaId: json['gpa_id'],
    governorateId: json['governorate_id'],
    cityId: json['city_id'],
    address: json['address'],
    SecondaryEducationAbroad:json['SecondaryEducationAbroad'],
    SecondaryEducationDivision:json['SecondaryEducationDivision'],
    SecondaryEducationRate:json['SecondaryEducationRate'],
    SecondaryEducationTotalScore:json['SecondaryEducationTotalScore'],
    adminId: json['admin_id'],
    employeeId: json['employee_id'],
    buildingId: json['building_id'],
   );
  }

  Map<String, dynamic> toJson() {
   return {
    'id': id,
    'name': name,
    'email': email,
    'Eygptian': eygptian,
    'nationalID': nationalID,
    'studentCode': studentCode,
    'birthDate': birthDate,
    'gender': gender,
    'religion': religion,
    'phoneNumber': phoneNumber,
    'mobileNumber': mobileNumber,
    'fatherName': fatherName,
    'fatherNationalID': fatherNationalID,
    'fatherOccupation': fatherOccupation,
    'fatherPhone': fatherPhone,
    'GuardianName': guardianName,
    'GuardianNationalID': guardianNationalID,
    'ParentsStatus': parentsStatus,
    'GuardianPhoneNumber': guardianPhoneNumber,
    'GuardianRelation': guardianRelation,
    'HousingType': housingType,
    'successRate': successRate,
    'HousingWithoutCatering': housingWithoutCatering,
    'HousingInPreviousYear': housingInPreviousYear,
    'FamilyAbroad': familyAbroad,
    'SpecialNeed': specialNeed,
    'password': password,
    'ConfirmPassword': confirmPassword,
    'college_id': collegeId,
    'Department': department,
    'level_id': levelId,
    'gpa_id': gpaId,
    'governorate_id': governorateId,
    'city_id': cityId,
    'address': address,
   'SecondaryEducationTotalScore':SecondaryEducationTotalScore,
   'SecondaryEducationRate' :SecondaryEducationRate,
   'SecondaryEducationAbroad':SecondaryEducationAbroad,
   'SecondaryEducationDivision' :SecondaryEducationDivision,
    'admin_id': adminId,
    'employee_id': employeeId,
    'building_id': buildingId,
   };
  }
 }