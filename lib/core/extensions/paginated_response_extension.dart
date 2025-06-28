import 'package:store_ads/core/classes/paginated_response.dart';

extension PaginatedResponseMapper<T> on PaginatedResponse<T> {
  PaginatedResponse<R> mapper<R>(R Function(T item) mapper) {
    return PaginatedResponse<R>(
      data: data.map(mapper).toList(),
      dataNameField: dataNameField,
      pageNumber: pageNumber,
      totalCount: totalCount,
      totalPages: totalPages,
      hasNextPage: hasNextPage,
      hasPreviousPage: hasPreviousPage,
    );
  }
}
