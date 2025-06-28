class AdParam {
  AdParam({
    required this.pageNumber,
    this.pageSize = 20,
    this.categoriesId,
    this.regionId,
    this.cityCode,
  });

  int pageNumber;
  int? pageSize;
  int? categoriesId;
  int? regionId;
  int? cityCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    if (categoriesId != null) {
      map['categoriesId'] = categoriesId;
    }
    if (regionId != null) {
      map['regionId'] = regionId;
    }
    if (cityCode != null) {
      map['cityCode'] = cityCode;
    }

    return map;
  }
}
