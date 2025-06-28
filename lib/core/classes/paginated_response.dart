class PaginatedResponse<T> {
  final List<T> data;
  final String? dataNameField;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  PaginatedResponse({
    required this.data,
    this.dataNameField,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory PaginatedResponse.fromJson({
    required Map<String, dynamic> json,
    required T Function(dynamic) fromJsonT,
    String? dataNameField,
  }) {
    return PaginatedResponse<T>(
      data: (json[dataNameField ?? 'data'] as List).map(fromJsonT).toList(),
      pageNumber: json['pageNumber'] ?? 1,
      totalPages: json['totalPages'] ?? 1,
      totalCount: json['totalCount'] ?? 0,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
      hasNextPage: json['hasNextPage'] ?? false,
    );
  }
}
