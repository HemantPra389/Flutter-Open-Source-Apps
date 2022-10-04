// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.v,
    this.type,
    this.count,
    this.expand,
    this.hits,
    this.next,
    this.query,
    this.select,
    this.start,
    this.total,
  });

  String? v;
  String? type;
  int? count;
  List<String>? expand;
  List<Hit>? hits;
  Next? next;
  Query? query;
  String? select;
  int? start;
  int? total;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        v: json["_v"],
        type: json["_type"],
        count: json["count"],
        expand: List<String>.from(json["expand"].map((x) => x)),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        next: Next.fromJson(json["next"]),
        query: Query.fromJson(json["query"]),
        select: json["select"],
        start: json["start"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "_v": v,
        "_type": type,
        "count": count,
        "expand": List<dynamic>.from(expand!.map((x) => x)),
        "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
        "next": next!.toJson(),
        "query": query!.toJson(),
        "select": select,
        "start": start,
        "total": total,
      };
}

class Hit {
  Hit({
    this.type,
    this.resourceState,
    this.brand,
    this.creationDate,
    this.id,
    this.lastModified,
    this.link,
    this.name,
    this.onlineFlag,
    this.owningCatalogId,
    this.searchable,
    this.shortDescription,
    this.hitType,
    this.unitQuantity,
    this.cVmmBrand,
    this.cVmmProductType,
    this.taxClassId,
    this.cColor,
    this.cSize,
    this.cVmmColor,
    this.cVmmDesign,
    this.cVmmFabric,
    this.cVmmFit,
    this.cVmmGender,
    this.cVmmMerchandiseCategory,
    this.cVmmPattern,
    this.cVmmProduct,
    this.cVmmQualityAssuranceId,
    this.cVmmReturnWindow,
    this.cVmmReturnWindowId,
    this.cVmmSize,
    this.cVmmSizeChart,
    this.cVmmSleeve,
    this.cVmmStyle,
  });

  HitType? type;
  String? resourceState;
  Brand? brand;
  DateTime? creationDate;
  String? id;
  DateTime? lastModified;
  String? link;
  CVmmBrand? name;
  OnlineFlag? onlineFlag;
  OwningCatalogId? owningCatalogId;
  OnlineFlag? searchable;
  ShortDescription? shortDescription;
  Type? hitType;
  int? unitQuantity;
  CVmmBrand? cVmmBrand;
  CVmmBrand? cVmmProductType;
  TaxClassId? taxClassId;
  CColor? cColor;
  String? cSize;
  CVmmBrand? cVmmColor;
  CVmmBrand? cVmmDesign;
  CVmmBrand? cVmmFabric;
  CVmmBrand? cVmmFit;
  CVmmBrand? cVmmGender;
  CVmmMerchandiseCategory? cVmmMerchandiseCategory;
  CVmm? cVmmPattern;
  CVmmBrand? cVmmProduct;
  CVmmQualityAssuranceId? cVmmQualityAssuranceId;
  CVmmBrand? cVmmReturnWindow;
  CVmmReturnWindowId? cVmmReturnWindowId;
  CVmmBrand? cVmmSize;
  CVmmSizeChart? cVmmSizeChart;
  CVmm? cVmmSleeve;
  CVmmBrand? cVmmStyle;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        type: hitTypeValues.map![json["_type"]],
        resourceState: json["_resource_state"],
        brand: brandValues.map![json["brand"]],
        creationDate: DateTime.parse(json["creation_date"]),
        id: json["id"],
        lastModified: DateTime.parse(json["last_modified"]),
        link: json["link"],
        name: CVmmBrand.fromJson(json["name"]),
        onlineFlag: OnlineFlag.fromJson(json["online_flag"]),
        owningCatalogId: owningCatalogIdValues.map![json["owning_catalog_id"]],
        searchable: OnlineFlag.fromJson(json["searchable"]),
        shortDescription: ShortDescription.fromJson(json["short_description"]),
        hitType: Type.fromJson(json["type"]),
        unitQuantity: json["unit_quantity"],
        cVmmBrand: CVmmBrand.fromJson(json["c_vmmBrand"]),
        cVmmProductType: CVmmBrand.fromJson(json["c_vmmProductType"]),
        taxClassId: json["tax_class_id"] == null
            ? null
            : taxClassIdValues.map![json["tax_class_id"]],
        cColor:
            json["c_color"] == null ? null : cColorValues.map![json["c_color"]],
        cSize: json["c_size"] == null ? null : json["c_size"],
        cVmmColor: json["c_vmmColor"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmColor"]),
        cVmmDesign: json["c_vmmDesign"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmDesign"]),
        cVmmFabric: json["c_vmmFabric"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmFabric"]),
        cVmmFit: json["c_vmmFit"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmFit"]),
        cVmmGender: json["c_vmmGender"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmGender"]),
        cVmmMerchandiseCategory: json["c_vmmMerchandiseCategory"] == null
            ? null
            : cVmmMerchandiseCategoryValues
                .map![json["c_vmmMerchandiseCategory"]],
        cVmmPattern: json["c_vmmPattern"] == null
            ? null
            : CVmm.fromJson(json["c_vmmPattern"]),
        cVmmProduct: json["c_vmmProduct"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmProduct"]),
        cVmmQualityAssuranceId: json["c_vmmQualityAssuranceId"] == null
            ? null
            : cVmmQualityAssuranceIdValues
                .map![json["c_vmmQualityAssuranceId"]],
        cVmmReturnWindow: json["c_vmmReturnWindow"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmReturnWindow"]),
        cVmmReturnWindowId: json["c_vmmReturnWindowId"] == null
            ? null
            : cVmmReturnWindowIdValues.map![json["c_vmmReturnWindowId"]],
        cVmmSize: json["c_vmmSize"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmSize"]),
        cVmmSizeChart: json["c_vmmSizeChart"] == null
            ? null
            : CVmmSizeChart.fromJson(json["c_vmmSizeChart"]),
        cVmmSleeve: json["c_vmmSleeve"] == null
            ? null
            : CVmm.fromJson(json["c_vmmSleeve"]),
        cVmmStyle: json["c_vmmStyle"] == null
            ? null
            : CVmmBrand.fromJson(json["c_vmmStyle"]),
      );

  Map<String, dynamic> toJson() => {
        "_type": hitTypeValues.reverse![type],
        "_resource_state": resourceState,
        "brand": brandValues.reverse![brand],
        "creation_date": creationDate!.toIso8601String(),
        "id": id,
        "last_modified": lastModified!.toIso8601String(),
        "link": link,
        "name": name!.toJson(),
        "online_flag": onlineFlag!.toJson(),
        "owning_catalog_id": owningCatalogIdValues.reverse![owningCatalogId],
        "searchable": searchable!.toJson(),
        "short_description": shortDescription!.toJson(),
        "type": hitType!.toJson(),
        "unit_quantity": unitQuantity,
        "c_vmmBrand": cVmmBrand!.toJson(),
        "c_vmmProductType": cVmmProductType!.toJson(),
        "tax_class_id":
            taxClassId == null ? null : taxClassIdValues.reverse![taxClassId],
        "c_color": cColor == null ? null : cColorValues.reverse![cColor],
        "c_size": cSize == null ? null : cSize,
        "c_vmmColor": cVmmColor == null ? null : cVmmColor!.toJson(),
        "c_vmmDesign": cVmmDesign == null ? null : cVmmDesign!.toJson(),
        "c_vmmFabric": cVmmFabric == null ? null : cVmmFabric!.toJson(),
        "c_vmmFit": cVmmFit == null ? null : cVmmFit!.toJson(),
        "c_vmmGender": cVmmGender == null ? null : cVmmGender!.toJson(),
        "c_vmmMerchandiseCategory": cVmmMerchandiseCategory == null
            ? null
            : cVmmMerchandiseCategoryValues.reverse![cVmmMerchandiseCategory],
        "c_vmmPattern": cVmmPattern == null ? null : cVmmPattern!.toJson(),
        "c_vmmProduct": cVmmProduct == null ? null : cVmmProduct!.toJson(),
        "c_vmmQualityAssuranceId": cVmmQualityAssuranceId == null
            ? null
            : cVmmQualityAssuranceIdValues.reverse![cVmmQualityAssuranceId],
        "c_vmmReturnWindow":
            cVmmReturnWindow == null ? null : cVmmReturnWindow!.toJson(),
        "c_vmmReturnWindowId": cVmmReturnWindowId == null
            ? null
            : cVmmReturnWindowIdValues.reverse![cVmmReturnWindowId],
        "c_vmmSize": cVmmSize == null ? null : cVmmSize!.toJson(),
        "c_vmmSizeChart":
            cVmmSizeChart == null ? null : cVmmSizeChart!.toJson(),
        "c_vmmSleeve": cVmmSleeve == null ? null : cVmmSleeve!.toJson(),
        "c_vmmStyle": cVmmStyle == null ? null : cVmmStyle!.toJson(),
      };
}

enum Brand { DRIFTWOOD }

final brandValues = EnumValues({"Driftwood": Brand.DRIFTWOOD});

enum CColor { LIGHT_BLUE, DARK_BLUE, WHITE }

final cColorValues = EnumValues({
  "Dark Blue": CColor.DARK_BLUE,
  "Light Blue": CColor.LIGHT_BLUE,
  "White": CColor.WHITE
});

class CVmmBrand {
  CVmmBrand({
    this.cVmmBrandDefault,
    this.hiIn,
  });

  String? cVmmBrandDefault;
  String? hiIn;

  factory CVmmBrand.fromJson(Map<String, dynamic> json) => CVmmBrand(
        cVmmBrandDefault: json["default"],
        hiIn: json["hi-IN"],
      );

  Map<String, dynamic> toJson() => {
        "default": cVmmBrandDefault,
        "hi-IN": hiIn,
      };
}

enum CVmmMerchandiseCategory { THE_111010007399, THE_111010012399 }

final cVmmMerchandiseCategoryValues = EnumValues({
  "111010007-399": CVmmMerchandiseCategory.THE_111010007399,
  "111010012-399": CVmmMerchandiseCategory.THE_111010012399
});

class CVmm {
  CVmm({
    this.cVmmDefault,
  });

  DefaultEnum? cVmmDefault;

  factory CVmm.fromJson(Map<String, dynamic> json) => CVmm(
        cVmmDefault: defaultEnumValues.map![json["default"]],
      );

  Map<String, dynamic> toJson() => {
        "default": defaultEnumValues.reverse![cVmmDefault],
      };
}

enum DefaultEnum { SOLID, PRINTED, FULL_SLEEVE, HALF_SLEEVE }

final defaultEnumValues = EnumValues({
  "Full Sleeve": DefaultEnum.FULL_SLEEVE,
  "Half Sleeve": DefaultEnum.HALF_SLEEVE,
  "Printed": DefaultEnum.PRINTED,
  "Solid": DefaultEnum.SOLID
});

enum CVmmQualityAssuranceId { ASSET_APPARELS_QUALITY_ASSURANCE }

final cVmmQualityAssuranceIdValues = EnumValues({
  "Asset-Apparels-Quality-Assurance":
      CVmmQualityAssuranceId.ASSET_APPARELS_QUALITY_ASSURANCE
});

enum CVmmReturnWindowId { ASSET_APPARELS_RETURN_POLICY }

final cVmmReturnWindowIdValues = EnumValues({
  "asset-apparels-return-policy":
      CVmmReturnWindowId.ASSET_APPARELS_RETURN_POLICY
});

class CVmmSizeChart {
  CVmmSizeChart({
    this.type,
    this.absUrl,
    this.disBaseUrl,
    this.path,
  });

  CVmmSizeChartType? type;
  String? absUrl;
  String? disBaseUrl;
  Path? path;

  factory CVmmSizeChart.fromJson(Map<String, dynamic> json) => CVmmSizeChart(
        type: cVmmSizeChartTypeValues.map![json["_type"]],
        absUrl: json["abs_url"],
        disBaseUrl: json["dis_base_url"],
        path: pathValues.map![json["path"]],
      );

  Map<String, dynamic> toJson() => {
        "_type": cVmmSizeChartTypeValues.reverse![type],
        "abs_url": absUrl,
        "dis_base_url": disBaseUrl,
        "path": pathValues.reverse![path],
      };
}

enum Path {
  IMAGES_SIZECHART_CASUAL_SHIRT_FULL_SLEEVES_131010016_JPG,
  IMAGES_SIZECHART_CASUAL_SHIRT_HALF_SLEEVES_131010017_JPG
}

final pathValues = EnumValues({
  "images/sizechart/Casual_shirt_full_sleeves_131010016.jpg":
      Path.IMAGES_SIZECHART_CASUAL_SHIRT_FULL_SLEEVES_131010016_JPG,
  "images/sizechart/Casual_shirt_Half_sleeves_131010017.jpg":
      Path.IMAGES_SIZECHART_CASUAL_SHIRT_HALF_SLEEVES_131010017_JPG
});

enum CVmmSizeChartType { MEDIA_FILE }

final cVmmSizeChartTypeValues =
    EnumValues({"media_file": CVmmSizeChartType.MEDIA_FILE});

class Type {
  Type({
    this.type,
    this.master,
    this.variant,
  });

  TypeType? type;
  bool? master;
  bool? variant;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: typeTypeValues.map![json["_type"]],
        master: json["master"] == null ? null : json["master"],
        variant: json["variant"] == null ? null : json["variant"],
      );

  Map<String, dynamic> toJson() => {
        "_type": typeTypeValues.reverse![type],
        "master": master == null ? null : master,
        "variant": variant == null ? null : variant,
      };
}

enum TypeType { PRODUCT_TYPE }

final typeTypeValues = EnumValues({"product_type": TypeType.PRODUCT_TYPE});

class OnlineFlag {
  OnlineFlag({
    this.onlineFlagDefault,
    this.defaultVishalmegamart,
  });

  bool? onlineFlagDefault;
  bool? defaultVishalmegamart;

  factory OnlineFlag.fromJson(Map<String, dynamic> json) => OnlineFlag(
        onlineFlagDefault: json["default"],
        defaultVishalmegamart: json["default@vishalmegamart"] == null
            ? null
            : json["default@vishalmegamart"],
      );

  Map<String, dynamic> toJson() => {
        "default": onlineFlagDefault,
        "default@vishalmegamart":
            defaultVishalmegamart == null ? null : defaultVishalmegamart,
      };
}

enum OwningCatalogId { VMM_APPAREL_MASTER_CATALOG }

final owningCatalogIdValues = EnumValues(
    {"vmm-apparel-master-catalog": OwningCatalogId.VMM_APPAREL_MASTER_CATALOG});

class ShortDescription {
  ShortDescription({
    this.shortDescriptionDefault,
    this.hiIn,
  });

  DefaultClass? shortDescriptionDefault;
  DefaultClass? hiIn;

  factory ShortDescription.fromJson(Map<String, dynamic> json) =>
      ShortDescription(
        shortDescriptionDefault: DefaultClass.fromJson(json["default"]),
        hiIn: DefaultClass.fromJson(json["hi-IN"]),
      );

  Map<String, dynamic> toJson() => {
        "default": shortDescriptionDefault!.toJson(),
        "hi-IN": hiIn!.toJson(),
      };
}

class DefaultClass {
  DefaultClass({
    this.type,
    this.markup,
    this.source,
  });

  DefaultType? type;
  Markup? markup;
  Markup? source;

  factory DefaultClass.fromJson(Map<String, dynamic> json) => DefaultClass(
        type: defaultTypeValues.map![json["_type"]],
        markup: markupValues.map![json["markup"]],
        source: markupValues.map![json["source"]],
      );

  Map<String, dynamic> toJson() => {
        "_type": defaultTypeValues.reverse![type],
        "markup": markupValues.reverse![markup],
        "source": markupValues.reverse![source],
      };
}

enum Markup { SPECIFICATIONS, EMPTY }

final markupValues = EnumValues(
    {"विशेष विवरण": Markup.EMPTY, "SPECIFICATIONS": Markup.SPECIFICATIONS});

enum DefaultType { MARKUP_TEXT }

final defaultTypeValues = EnumValues({"markup_text": DefaultType.MARKUP_TEXT});

enum TaxClassId { GST_TAX_3 }

final taxClassIdValues = EnumValues({"gst-tax-3": TaxClassId.GST_TAX_3});

enum HitType { PRODUCT }

final hitTypeValues = EnumValues({"product": HitType.PRODUCT});

class Next {
  Next({
    this.type,
    this.count,
    this.start,
  });

  String? type;
  int? count;
  int? start;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        type: json["_type"],
        count: json["count"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "count": count,
        "start": start,
      };
}

class Query {
  Query({
    this.textQuery,
  });

  TextQuery? textQuery;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        textQuery: TextQuery.fromJson(json["text_query"]),
      );

  Map<String, dynamic> toJson() => {
        "text_query": textQuery!.toJson(),
      };
}

class TextQuery {
  TextQuery({
    this.type,
    this.fields,
    this.searchPhrase,
  });

  String? type;
  List<String>? fields;
  String? searchPhrase;

  factory TextQuery.fromJson(Map<String, dynamic> json) => TextQuery(
        type: json["_type"],
        fields: List<String>.from(json["fields"].map((x) => x)),
        searchPhrase: json["search_phrase"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "fields": List<dynamic>.from(fields!.map((x) => x)),
        "search_phrase": searchPhrase,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
