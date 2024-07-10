class StudentModel {
  String? name;
  bool? eygptian;
  String? nationalID;
  String? studentCode;
  String? birthDate;
  String? gender;
  String? religion;
  String? phoneNumber;
  String? mobileNumber;
  String? fatherName;
  String? fatherNationalID;
  String? fatherOccupation;
  String? fatherphone;
  String? guardianName;
  String? guardianNationalID;
  String? parentsStatus;
  String? guardianPhoneNumber;
  String? guardianRelation;
  String? housingType;
  String? housingPreviousYear;
  double? successRate;
  int? housingWithoutCatering;
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
  String? email;
  

  StudentModel(
      {
      this.name,
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
      this.fatherphone,
      this.guardianName,
      this.guardianNationalID,
      this.parentsStatus,
      this.guardianPhoneNumber,
      this.guardianRelation,
      this.housingType,
      this.housingPreviousYear,
      this.successRate,
      this.housingWithoutCatering,
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
      this.email,
      });

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    eygptian = json['Eygptian'];
    nationalID = json['nationalID'];
    studentCode = json['studentCode'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    religion = json['religion'];
    phoneNumber = json['phoneNumber'];
    mobileNumber = json['mobileNumber'];
    fatherName = json['fatherName'];
    fatherNationalID = json['fatherNationalID'];
    fatherOccupation = json['fatherOccupation'];
    fatherphone = json['fatherphone'];
    guardianName = json['GuardianName'];
    guardianNationalID = json['GuardianNationalID'];
    parentsStatus = json['ParentsStatus'];
    guardianPhoneNumber = json['GuardianPhoneNumber'];
    guardianRelation = json['GuardianRelation'];
    housingType = json['HousingType'];
    housingPreviousYear = json['HousingPreviousYear'];
    successRate = json['successRate'];
    housingWithoutCatering = json['HousingWithoutCatering'];
    familyAbroad = json['FamilyAbroad'];
    specialNeed = json['SpecialNeed'];
    password = json['password'];
    confirmPassword = json['ConfirmPassword'];
    collegeId = json['college_id'];
    department = json['Department'];
    levelId = json['level_id'];
    gpaId = json['gpa_id'];
    governorateId = json['governorate_id'];
    cityId = json['city_id'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Eygptian'] = this.eygptian;
    data['nationalID'] = this.nationalID;
    data['studentCode'] = this.studentCode;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['phoneNumber'] = this.phoneNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['fatherName'] = this.fatherName;
    data['fatherNationalID'] = this.fatherNationalID;
    data['fatherOccupation'] = this.fatherOccupation;
    data['fatherphone'] = this.fatherphone;
    data['GuardianName'] = this.guardianName;
    data['GuardianNationalID'] = this.guardianNationalID;
    data['ParentsStatus'] = this.parentsStatus;
    data['GuardianPhoneNumber'] = this.guardianPhoneNumber;
    data['GuardianRelation'] = this.guardianRelation;
    data['HousingType'] = this.housingType;
    data['HousingPreviousYear'] = this.housingPreviousYear;
    data['successRate'] = this.successRate;
    data['HousingWithoutCatering'] = this.housingWithoutCatering;
    data['FamilyAbroad'] = this.familyAbroad;
    data['SpecialNeed'] = this.specialNeed;
    data['password'] = this.password;
    data['ConfirmPassword'] = this.confirmPassword;
    data['college_id'] = this.collegeId;
    data['Department'] = this.department;
    data['level_id'] = this.levelId;
    data['gpa_id'] = this.gpaId;
    data['governorate_id'] = this.governorateId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}