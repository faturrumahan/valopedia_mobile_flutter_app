class MapModel {
  final int? status;
  final List<Data>? data;

  MapModel({
    this.status,
    this.data,
  });

  MapModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? uuid;
  final String? displayName;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? splash;
  final String? assetPath;
  final String? mapUrl;

  Data({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
  });

  Data.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        displayName = json['displayName'] as String?,
        coordinates = json['coordinates'] as String?,
        displayIcon = json['displayIcon'] as String?,
        listViewIcon = json['listViewIcon'] as String?,
        splash = json['splash'] as String?,
        assetPath = json['assetPath'] as String?,
        mapUrl = json['mapUrl'] as String?;

  Map<String, dynamic> toJson() => {
    'uuid' : uuid,
    'displayName' : displayName,
    'coordinates' : coordinates,
    'displayIcon' : displayIcon,
    'listViewIcon' : listViewIcon,
    'splash' : splash,
    'assetPath' : assetPath,
    'mapUrl' : mapUrl
  };
}