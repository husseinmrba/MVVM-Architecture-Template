class AdModel {
  AdModel({
    this.id,
    this.iconId,
    this.videoId,
    this.cityCode,
    this.title,
    this.description,
    this.price,
    this.advertisementDuration,
    this.contentInfo,
    this.isActive,
    this.created,
  });

  AdModel.fromJson(dynamic json) {
    id = json['id'];
    iconId = json['iconId'];
    videoId = json['videoId'];
    cityCode = json['cityCode'];
    title = json['tital'];
    description = json['description'];
    price = json['price'];
    advertisementDuration = json['advertisementDuration'];
    contentInfo = json['contentInfo'];
    isActive = json['isActive'];
    created = json['created'];
  }
  String? id;
  String? iconId;
  String? videoId;
  String? cityCode;
  String? title;
  String? description;
  num? price;
  String? advertisementDuration;
  String? contentInfo;
  bool? isActive;
  String? created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['iconId'] = iconId;
    map['videoId'] = videoId;
    map['cityCode'] = cityCode;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['advertisementDuration'] = advertisementDuration;
    map['contentInfo'] = contentInfo;
    map['isActive'] = isActive;
    map['created'] = created;
    return map;
  }
}
