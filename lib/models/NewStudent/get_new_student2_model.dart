/*class newStudent {
  int? id;
  String? name;
  String? email;
  int? eygptian;
  String? nationalID;
  String? studentCode;
  DateTime? birthDate;
  String? gender;
  String? religion;
  String? phoneNumber;
  String? mobileNumber;
  String? fatherName;
  String? fatherNationalID;
  String? fatherOccupation;
  String? fatherPhone;
  String? guardianName;
  String? guardianNationalID;
  String? parentsStatus;
  String? guardianPhoneNumber;
  String? guardianRelation;
  String? housingType;
  int? housingWithoutCatering;
  String? housingInPreviousYear;
  int? familyAbroad;
  String? specialNeed;
  int? SecondaryEducationTotalScore;
  int? SecondaryEducationRate;
  String? SecondaryEducationAbroad;
  String? SecondaryEducationDivision;
  String? password;
  String? collegeId;
  int? levelId;
  int? governorateId;
  int? cityId;
  String? address;
  String? department;
  int? gpaId;
  String? confirmPassword;
  int? successRate;

  newStudent({
    this.id,
    this.name,
    this.email,
    this.eygptian,
    this.nationalID,
    this.studentCode,
    this.birthDate,
    this.gender,
    this.religion,
    this.phoneNumber,
    this.mobileNumber,
    this.fatherName,
    this.fatherNationalID,
    this.fatherOccupation,
    this.fatherPhone,
    this.guardianName,
    this.guardianNationalID,
    this.parentsStatus,
    this.guardianPhoneNumber,
    this.guardianRelation,
    this.housingType,
    this.housingWithoutCatering,
    this.housingInPreviousYear,
    this.familyAbroad,
    this.specialNeed,
    this.SecondaryEducationTotalScore ,
    this.SecondaryEducationRate,
    this.SecondaryEducationAbroad,
    this.SecondaryEducationDivision,
    this.password,
    this.confirmPassword,
    this.collegeId,
    this.levelId,
    this.governorateId,
    this.cityId,
    this.address,
    this.department,
    this.successRate,
    this.gpaId

  });

  factory newStudent.fromJson(Map<String, dynamic> json) {
    return newStudent(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      eygptian: json['Eygptian'],
      nationalID: json['nationalID'],
      studentCode: json['studentCode'],
      birthDate: DateTime.parse(json['birthDate']),
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
      housingWithoutCatering: json['HousingWithoutCatering'],
      familyAbroad: json['FamilyAbroad'],
      specialNeed: json['SpecialNeed'],
      password: json['password'],
      SecondaryEducationAbroad:json['SecondaryEducationAbroad'] ,
      SecondaryEducationDivision:json['SecondaryEducationDivision'] ,
      SecondaryEducationRate:json['SecondaryEducationRate'] ,
      SecondaryEducationTotalScore:json['SecondaryEducationTotalScore'] ,
      confirmPassword: json['ConfirmPassword'],
      collegeId: json['college_id'],
      levelId: json['level_id'],
      governorateId: json['governorate_id'],
      cityId: json['city_id'],
      address: json['address'],
      department: json['Department'],
      housingInPreviousYear: json['HousingInPreviousYear'],
      gpaId: json['gpa_id'],
      successRate: json['successRate'],
    );
  }

}*/