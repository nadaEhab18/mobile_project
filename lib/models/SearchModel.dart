class SearchModel {
  final List<Result> result;
  final String message;

  SearchModel({
    required this.result,
    required this.message,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(
        name: json["name"],
        nationalId: json["nationalID"],
        collegeName: json["college_name"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "nationalID": nationalId,
        "college_name": collegeName,
      };
}