class BundleModel {
  final int? status;
  final List<Data>? data;

  BundleModel({
    this.status,
    this.data,
  });

  BundleModel.fromJson(Map<String, dynamic> json)
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
  final dynamic displayNameSubText;
  final String? description;
  final dynamic extraDescription;
  final dynamic promoDescription;
  final bool? useAdditionalContext;
  final String? displayIcon;
  final String? displayIcon2;
  final String? verticalPromoImage;
  final String? assetPath;

  Data({
    this.uuid,
    this.displayName,
    this.displayNameSubText,
    this.description,
    this.extraDescription,
    this.promoDescription,
    this.useAdditionalContext,
    this.displayIcon,
    this.displayIcon2,
    this.verticalPromoImage,
    this.assetPath,
  });

  Data.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        displayName = json['displayName'] as String?,
        displayNameSubText = json['displayNameSubText'],
        description = json['description'] as String?,
        extraDescription = json['extraDescription'],
        promoDescription = json['promoDescription'],
        useAdditionalContext = json['useAdditionalContext'] as bool?,
        displayIcon = json['displayIcon'] as String?,
        displayIcon2 = json['displayIcon2'] as String?,
        verticalPromoImage = json['verticalPromoImage'] as String?,
        assetPath = json['assetPath'] as String?;

  Map<String, dynamic> toJson() => {
    'uuid' : uuid,
    'displayName' : displayName,
    'displayNameSubText' : displayNameSubText,
    'description' : description,
    'extraDescription' : extraDescription,
    'promoDescription' : promoDescription,
    'useAdditionalContext' : useAdditionalContext,
    'displayIcon' : displayIcon,
    'displayIcon2' : displayIcon2,
    'verticalPromoImage' : verticalPromoImage,
    'assetPath' : assetPath
  };
}