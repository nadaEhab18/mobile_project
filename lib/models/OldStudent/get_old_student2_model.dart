class Student {
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
  int? successRate;
  int? housingWithoutCatering;
  String? housingInPreviousYear;
  int? familyAbroad;
  int? specialNeed;
  String? password;
  String? confirmPassword;
  int? collegeId;
  String? department;
  int? levelId;
  int? gpaId;
  int? governorateId;
  int? cityId;
  String? address;
  int? adminId;
  int? employeeId;
  int? buildingId;

  Student({
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
    this.successRate,
    this.housingWithoutCatering,
    this.housingInPreviousYear,
    this.familyAbroad,
    this.specialNeed,
    this.password,
    this.confirmPassword,
    this.collegeId,
    this.department,
    this.levelId,
    this.gpaId,
    this.governorateId,
    this.cityId,
    this.address,
    this.adminId,
    this.employeeId,
    this.buildingId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
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
      adminId: json['admin_id'],
      employeeId: json['employee_id'],
      buildingId: json['building_id'],
    );
  }
}