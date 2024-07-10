class StudentResultModel {
  final List<Result> result;
  final String message;

  StudentResultModel({
    required this.result,
    required this.message,
  });

  factory StudentResultModel.fromJson(Map<String, dynamic> json) => StudentResultModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "message": message,
  };
}

class Result {
  final String name;
  final String nationalId;
  final String collegeName;

  Result({
    required this.name,
    required this.nationalId,
    required this.collegeName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    nationalId: json["national_id"],
    collegeName: json["college_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "national_id": nationalId,
    "college_name": collegeName,
  };
}