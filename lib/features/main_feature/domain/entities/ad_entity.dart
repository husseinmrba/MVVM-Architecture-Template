class AdEntity {
  AdEntity({
    required this.id,
    required this.iconId,
    required this.videoId,
    required this.cityCode,
    required this.title,
    required this.description,
    required this.price,
    required this.advertisementDuration,
    required this.contentInfo,
    required this.isActive,
    required this.created,
  });

  String id;
  String iconId;
  String videoId;
  String cityCode;
  String title;
  String description;
  num price;
  String advertisementDuration;
  String contentInfo;
  bool isActive;
  String created;
}
