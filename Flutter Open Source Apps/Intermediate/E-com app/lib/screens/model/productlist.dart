// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.v,
    this.type,
    this.count,
    this.hits,
    this.next,
    this.refinements,
    this.searchPhraseSuggestions,
    this.selectedRefinements,
    this.sortingOptions,
    this.start,
    this.total,
  });

  String? v;
  String? type;
  int? count;
  List<Hit>? hits;
  String? next;
  List<Refinement>? refinements;
  SearchPhraseSuggestions? searchPhraseSuggestions;
  SelectedRefinements? selectedRefinements;
  List<SortingOption>? sortingOptions;
  int? start;
  int? total;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        v: json["_v"],
        type: json["_type"],
        count: json["count"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        next: json["next"],
        refinements: List<Refinement>.from(
            json["refinements"].map((x) => Refinement.fromJson(x))),
        searchPhraseSuggestions:
            SearchPhraseSuggestions.fromJson(json["search_phrase_suggestions"]),
        selectedRefinements:
            SelectedRefinements.fromJson(json["selected_refinements"]),
        sortingOptions: List<SortingOption>.from(
            json["sorting_options"].map((x) => SortingOption.fromJson(x))),
        start: json["start"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "_v": v,
        "_type": type,
        "count": count,
        "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
        "next": next,
        "refinements": List<dynamic>.from(refinements!.map((x) => x.toJson())),
        "search_phrase_suggestions": searchPhraseSuggestions!.toJson(),
        "selected_refinements": selectedRefinements!.toJson(),
        "sorting_options":
            List<dynamic>.from(sortingOptions!.map((x) => x.toJson())),
        "start": start,
        "total": total,
      };
}

class Hit {
  Hit({
    this.type,
    this.hitType,
    this.image,
    this.link,
    this.productId,
    this.productName,
    this.productType,
    this.representedProduct,
    this.cAvailability,
    this.cBrand,
    this.cVmmProductType,
    this.cIsPromoAvailable,
    this.cPromoMessage,
    this.cPriceRange,
    this.cListprice,
    this.cSaleprice,
    this.cDiscount,
  });

  HitType? type;
  HitTypeEnum? hitType;
  Image? image;
  String? link;
  String? productId;
  String? productName;
  ProductType? productType;
  RepresentedProduct? representedProduct;
  CAvailability? cAvailability;
  CBrand? cBrand;
  CVmmProductType? cVmmProductType;
  bool? cIsPromoAvailable;
  CPromoMessage? cPromoMessage;
  bool? cPriceRange;
  double? cListprice;
  double? cSaleprice;
  double? cDiscount;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        type: hitTypeValues.map![json["_type"]],
        hitType: hitTypeEnumValues.map![json["hit_type"]],
        image: Image.fromJson(json["image"]),
        link: json["link"],
        productId: json["product_id"],
        productName: json["product_name"],
        productType: ProductType.fromJson(json["product_type"]),
        representedProduct:
            RepresentedProduct.fromJson(json["represented_product"]),
        cAvailability: cAvailabilityValues.map![json["c_availability"]],
        cBrand: cBrandValues.map![json["c_brand"]],
        cVmmProductType: cVmmProductTypeValues.map![json["c_vmmProductType"]],
        cIsPromoAvailable: json["c_isPromoAvailable"],
        cPromoMessage: cPromoMessageValues.map![json["c_promoMessage"]],
        cPriceRange: json["c_priceRange"],
        cListprice: json["c_listprice"],
        cSaleprice: json["c_saleprice"],
        cDiscount: json["c_discount"] == null ? null : json["c_discount"],
      );

  Map<String, dynamic> toJson() => {
        "_type": hitTypeValues.reverse![type],
        "hit_type": hitTypeEnumValues.reverse![hitType],
        "image": image!.toJson(),
        "link": link,
        "product_id": productId,
        "product_name": productName,
        "product_type": productType!.toJson(),
        "represented_product": representedProduct!.toJson(),
        "c_availability": cAvailabilityValues.reverse![cAvailability],
        "c_brand": cBrandValues.reverse![cBrand],
        "c_vmmProductType": cVmmProductTypeValues.reverse![cVmmProductType],
        "c_isPromoAvailable": cIsPromoAvailable,
        "c_promoMessage": cPromoMessageValues.reverse![cPromoMessage],
        "c_priceRange": cPriceRange,
        "c_listprice": cListprice,
        "c_saleprice": cSaleprice,
        "c_discount": cDiscount == null ? null : cDiscount,
      };
}

enum CAvailability { IN_STOCK }

final cAvailabilityValues = EnumValues({"IN_STOCK": CAvailability.IN_STOCK});

enum CBrand { BRINK, DRIFTWOOD }

final cBrandValues =
    EnumValues({"Brink": CBrand.BRINK, "Driftwood": CBrand.DRIFTWOOD});

enum CPromoMessage {
  GET_50_OFF,
  EMPTY,
  BUY_2_ABOVE_GET_20_OFF,
  BUY_1_GET_1_FREE
}

final cPromoMessageValues = EnumValues({
  "Buy 1 Get 1 Free": CPromoMessage.BUY_1_GET_1_FREE,
  "Buy 2 & Above Get 20 % Off": CPromoMessage.BUY_2_ABOVE_GET_20_OFF,
  "": CPromoMessage.EMPTY,
  "Get ₹50 off": CPromoMessage.GET_50_OFF
});

enum CVmmProductType { APPAREL }

final cVmmProductTypeValues = EnumValues({"Apparel": CVmmProductType.APPAREL});

enum HitTypeEnum { VARIATION_GROUP }

final hitTypeEnumValues =
    EnumValues({"variation_group": HitTypeEnum.VARIATION_GROUP});

class Image {
  Image({
    this.type,
    this.alt,
    this.disBaseLink,
    this.link,
    this.title,
  });

  ImageType? type;
  String? alt;
  String? disBaseLink;
  String? link;
  String? title;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        type: imageTypeValues.map![json["_type"]],
        alt: json["alt"],
        disBaseLink: json["dis_base_link"],
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_type": imageTypeValues.reverse![type],
        "alt": alt,
        "dis_base_link": disBaseLink,
        "link": link,
        "title": title,
      };
}

enum ImageType { IMAGE }

final imageTypeValues = EnumValues({"image": ImageType.IMAGE});

class ProductType {
  ProductType({
    this.type,
    this.variationGroup,
  });

  ProductTypeType? type;
  bool? variationGroup;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        type: productTypeTypeValues.map![json["_type"]],
        variationGroup: json["variation_group"],
      );

  Map<String, dynamic> toJson() => {
        "_type": productTypeTypeValues.reverse![type],
        "variation_group": variationGroup,
      };
}

enum ProductTypeType { PRODUCT_TYPE }

final productTypeTypeValues =
    EnumValues({"product_type": ProductTypeType.PRODUCT_TYPE});

class RepresentedProduct {
  RepresentedProduct({
    this.type,
    this.id,
    this.link,
  });

  RepresentedProductType? type;
  String? id;
  String? link;

  factory RepresentedProduct.fromJson(Map<String, dynamic> json) =>
      RepresentedProduct(
        type: representedProductTypeValues.map![json["_type"]],
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_type": representedProductTypeValues.reverse![type],
        "id": id,
        "link": link,
      };
}

enum RepresentedProductType { PRODUCT_REF }

final representedProductTypeValues =
    EnumValues({"product_ref": RepresentedProductType.PRODUCT_REF});

enum HitType { PRODUCT_SEARCH_HIT }

final hitTypeValues =
    EnumValues({"product_search_hit": HitType.PRODUCT_SEARCH_HIT});

class Refinement {
  Refinement({
    this.type,
    this.attributeId,
    this.label,
    this.values,
  });

  RefinementType? type;
  String? attributeId;
  String? label;
  List<Value>? values;

  factory Refinement.fromJson(Map<String, dynamic> json) => Refinement(
        type: refinementTypeValues.map![json["_type"]],
        attributeId: json["attribute_id"],
        label: json["label"],
        values: json["values"] == null
            ? null
            : List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_type": refinementTypeValues.reverse![type],
        "attribute_id": attributeId,
        "label": label,
        "values": values == null
            ? null
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

enum RefinementType { PRODUCT_SEARCH_REFINEMENT }

final refinementTypeValues = EnumValues(
    {"product_search_refinement": RefinementType.PRODUCT_SEARCH_REFINEMENT});

class Value {
  Value({
    this.type,
    this.hitCount,
    this.label,
    this.value,
    this.values,
  });

  ValueType? type;
  int? hitCount;
  String? label;
  String? value;
  List<Value>? values;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        type: valueTypeValues.map![json["_type"]],
        hitCount: json["hit_count"],
        label: json["label"],
        value: json["value"],
        values: json["values"] == null
            ? null
            : List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_type": valueTypeValues.reverse![type],
        "hit_count": hitCount,
        "label": label,
        "value": value,
        "values": values == null
            ? null
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

enum ValueType { PRODUCT_SEARCH_REFINEMENT_VALUE }

final valueTypeValues = EnumValues({
  "product_search_refinement_value": ValueType.PRODUCT_SEARCH_REFINEMENT_VALUE
});

class SearchPhraseSuggestions {
  SearchPhraseSuggestions({
    this.type,
  });

  String? type;

  factory SearchPhraseSuggestions.fromJson(Map<String, dynamic> json) =>
      SearchPhraseSuggestions(
        type: json["_type"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
      };
}

class SelectedRefinements {
  SelectedRefinements({
    this.cgid,
    this.price,
  });

  String? cgid;
  String? price;

  factory SelectedRefinements.fromJson(Map<String, dynamic> json) =>
      SelectedRefinements(
        cgid: json["cgid"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "cgid": cgid,
        "price": price,
      };
}

class SortingOption {
  SortingOption({
    this.type,
    this.id,
    this.label,
  });

  String? type;
  String? id;
  String? label;

  factory SortingOption.fromJson(Map<String, dynamic> json) => SortingOption(
        type: json["_type"],
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "id": id,
        "label": label,
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
