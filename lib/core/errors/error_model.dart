class ErrorModel {
  final String detail;
  final String? instance;
  final List<String>? errors;

  ErrorModel({
    required this.detail,
    this.instance,
    this.errors = const [],
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      detail: jsonData["detail"] ?? '',
      instance: jsonData["instance"] ?? '',
      errors: (jsonData["errors"] != null)
          ? List<String>.from(jsonData["errors"] as List<dynamic>)
          : [],
    );
  }
}
