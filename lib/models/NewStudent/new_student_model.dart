class newStudent {
  String? name;
  String? email;
  int? eygptian;
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
  String? guardianPhoneNumber;
  String? guardianRelation;
  String? parentsStatus;
  String? housingType;
  int? housingWithoutCatering;
  String? HousingPreviousYear;
  int? familyAbroad;
  int? specialNeed;
  int? secondaryEducationTotalScore;
  int? secondaryEducationRate;
  int? secondaryEducationAbroad;
  String? secondaryEducationDivision;
  String? password;
  String? confirmPassword;
  int? collegeId;
  int? levelId;
  int? governorateId;
  int? cityId;
  String? address;
  String? Department;
  int? gpa_id;
  int? successRate;

  newStudent(
      {this.name,
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
        this.fatherphone,
        this.guardianName,
        this.guardianNationalID,
        this.guardianPhoneNumber,
        this.guardianRelation,
        this.parentsStatus,
        this.housingType,
        this.housingWithoutCatering,
        this.familyAbroad,
        this.specialNeed,
        this.secondaryEducationTotalScore,
        this.secondaryEducationRate,
        this.secondaryEducationAbroad,
        this.secondaryEducationDivision,
        this.password,
        this.confirmPassword,
        this.collegeId,
        this.levelId,
        this.governorateId,
        this.cityId,
        this.address,
        this.Department,
        this.HousingPreviousYear,
        this.gpa_id,
        this.successRate
      });

  newStudent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
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
    guardianPhoneNumber = json['GuardianPhoneNumber'];
    guardianRelation = json['GuardianRelation'];
    parentsStatus = json['ParentsStatus'];
    housingType = json['HousingType'];
    housingWithoutCatering = json['HousingWithoutCatering'];
    familyAbroad = json['FamilyAbroad'];
    specialNeed = json['SpecialNeed'];
    secondaryEducationTotalScore = json['SecondaryEducationTotalScore'];
    secondaryEducationRate = json['SecondaryEducationRate'];
    secondaryEducationAbroad = json['SecondaryEducationAbroad'];
    secondaryEducationDivision = json['SecondaryEducationDivision'];
    password = json['password'];
    confirmPassword = json['ConfirmPassword'];
    collegeId = json['college_id'];
    levelId = json['level_id'];
    governorateId = json['governorate_id'];
    cityId = json['city_id'];
    address = json['address'];
    Department =json['Department'];
    gpa_id=json['gpa_id'] ;
    HousingPreviousYear=json['HousingPreviousYear'];
    successRate=json['successRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
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
    data['GuardianPhoneNumber'] = this.guardianPhoneNumber;
    data['GuardianRelation'] = this.guardianRelation;
    data['ParentsStatus'] = this.parentsStatus;
    data['HousingType'] = this.housingType;
    data['HousingWithoutCatering'] = this.housingWithoutCatering;
    data['FamilyAbroad'] = this.familyAbroad;
    data['SpecialNeed'] = this.specialNeed;
    data['SecondaryEducationTotalScore'] = this.secondaryEducationTotalScore;
    data['SecondaryEducationRate'] = this.secondaryEducationRate;
    data['SecondaryEducationAbroad'] = this.secondaryEducationAbroad;
    data['SecondaryEducationDivision'] = this.secondaryEducationDivision;
    data['password'] = this.password;
    data['ConfirmPassword'] = this.confirmPassword;
    data['college_id'] = this.collegeId;
    data['level_id'] = this.levelId;
    data['governorate_id'] = this.governorateId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['successRate'] = this.successRate;
    data['HousingPreviousYear'] = this.HousingPreviousYear;
    data['gpa_id']=this.gpa_id;
    data['Department']=this.Department;
    return data;
  }
}
