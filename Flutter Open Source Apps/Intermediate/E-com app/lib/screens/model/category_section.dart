// import 'package:json_annotation/json_annotation.dart';

// part 'category_section.g.dart';

// @JsonSerializable()
// class CategorySection {
//   @JsonKey(name: '_v')
//   String? V;
//   @JsonKey(name: '_type')
//   String? Type;
//   @JsonKey(name: '_resource_state')
//   String? ResourceState;
//   @JsonKey(name: 'catalog_id')
//   String? catalogId;
//   @JsonKey(name: 'categories')
//   List<Categorie>? categories;
//   @JsonKey(name: 'creation_date')
//   String? creationDate;
//   @JsonKey(name: 'id')
//   String? id;
//   @JsonKey(name: 'last_modified')
//   String? lastModified;
//   @JsonKey(name: 'link')
//   String? link;
//   @JsonKey(name: 'online')
//   bool? online;
//   @JsonKey(name: 'page_description')
//   PageDescription? pageDescription;
//   @JsonKey(name: 'page_keywords')
//   PageKeywords? pageKeywords;
//   @JsonKey(name: 'page_title')
//   PageTitle? pageTitle;
//   @JsonKey(name: 'c_enableCompare')
//   bool? cEnableCompare;
//   @JsonKey(name: 'c_showInMenu')
//   bool? cShowInMenu;

//   CategorySection({
//     this.V,
//     this.Type,
//     this.ResourceState,
//     this.catalogId,
//     this.categories,
//     this.creationDate,
//     this.id,
//     this.lastModified,
//     this.link,
//     this.online,
//     this.pageDescription,
//     this.pageKeywords,
//     this.pageTitle,
//     this.cEnableCompare,
//     this.cShowInMenu,
//   });

//   factory CategorySection.fromJson(Map<String, dynamic> json) =>
//       _$CategorySectionFromJson(json);

//   Map<String, dynamic> toJson() => _$CategorySectionToJson(this);
// }

// @JsonSerializable()
// class Categorie {
//   @JsonKey(name: '_type')
//   String? Type;
//   @JsonKey(name: 'catalog_id')
//   String? catalogId;
//   @JsonKey(name: 'creation_date')
//   String? creationDate;
//   @JsonKey(name: 'description')
//   Description? description;
//   @JsonKey(name: 'id')
//   String? id;
//   @JsonKey(name: 'last_modified')
//   String? lastModified;
//   @JsonKey(name: 'link')
//   String? link;
//   @JsonKey(name: 'name')
//   Name? name;
//   @JsonKey(name: 'online')
//   bool? online;
//   @JsonKey(name: 'page_description')
//   PageDescription? pageDescription;
//   @JsonKey(name: 'page_keywords')
//   PageKeywords? pageKeywords;
//   @JsonKey(name: 'page_title')
//   PageTitle? pageTitle;
//   @JsonKey(name: 'parent_category_id')
//   String? parentCategoryId;
//   @JsonKey(name: 'thumbnail')
//   String? thumbnail;
//   @JsonKey(name: 'c_enableCompare')
//   bool? cEnableCompare;
//   @JsonKey(name: 'c_showInMenu')
//   bool? cShowInMenu;

//   Categorie(
//       {this.Type,
//       this.catalogId,
//       this.creationDate,
//       this.description,
//       this.id,
//       this.lastModified,
//       this.link,
//       this.name,
//       this.online,
//       this.pageDescription,
//       this.pageKeywords,
//       this.pageTitle,
//       this.parentCategoryId,
//       this.thumbnail,
//       this.cEnableCompare,
//       this.cShowInMenu});

//   factory Categorie.fromJson(Map<String, dynamic> json) =>
//       _$CategorieFromJson(json);

//   Map<String, dynamic> toJson() => _$CategorieToJson(this);
// }

// @JsonSerializable()
// class Description {
//   @JsonKey(name: 'default')
//   String? defaults;

//   Description({this.defaults});

//   factory Description.fromJson(Map<String, dynamic> json) =>
//       _$DescriptionFromJson(json);

//   Map<String, dynamic> toJson() => _$DescriptionToJson(this);
// }

// @JsonSerializable()
// class Name {
//   @JsonKey(name: 'default')
//   String? defaults;
//   @JsonKey(name: 'hi-IN')
//   String? hi_IN;

//   Name({this.defaults, this.hi_IN});

//   factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

//   Map<String, dynamic> toJson() => _$NameToJson(this);
// }

// @JsonSerializable()
// class PageDescription {
//   @JsonKey(name: 'default')
//   String? defaults;

//   PageDescription({this.defaults});

//   factory PageDescription.fromJson(Map<String, dynamic> json) =>
//       _$PageDescriptionFromJson(json);

//   Map<String, dynamic> toJson() => _$PageDescriptionToJson(this);
// }

// @JsonSerializable()
// class PageKeywords {
//   @JsonKey(name: 'default')
//   String? defaults;

//   PageKeywords({this.defaults});

//   factory PageKeywords.fromJson(Map<String, dynamic> json) =>
//       _$PageKeywordsFromJson(json);

//   Map<String, dynamic> toJson() => _$PageKeywordsToJson(this);
// }

// @JsonSerializable()
// class PageTitle {
//   @JsonKey(name: 'default')
//   String? defaults;

//   PageTitle({this.defaults});

//   factory PageTitle.fromJson(Map<String, dynamic> json) =>
//       _$PageTitleFromJson(json);

//   Map<String, dynamic> toJson() => _$PageTitleToJson(this);
// }





// To parse this JSON data, do
//
//     final categorySection = categorySectionFromJson(jsonString);

import 'dart:convert';

CategorySection categorySectionFromJson(String str) => CategorySection.fromJson(json.decode(str));

String categorySectionToJson(CategorySection data) => json.encode(data.toJson());

class CategorySection {
    CategorySection({
        this.v,
        this.type,
        this.resourceState,
        this.catalogId,
        this.categories,
        this.creationDate,
        this.id,
        this.lastModified,
        this.link,
        this.online,
        this.pageDescription,
        this.pageKeywords,
        this.pageTitle,
        this.cEnableCompare,
        this.cShowInMenu,
        this.description,
        this.name,
        this.parentCategoryId,
        this.thumbnail,
    });

    String? v;
    Type? type;
    String? resourceState;
    CatalogId? catalogId;
    List<CategorySection>? categories;
    DateTime? creationDate;
    String? id;
    DateTime? lastModified;
    String? link;
    bool? online;
    Page? pageDescription;
    Page? pageKeywords;
    Page? pageTitle;
    bool? cEnableCompare;
    bool? cShowInMenu;
    Description? description;
    Description? name;
    ParentCategoryId? parentCategoryId;
    String? thumbnail;

    factory CategorySection.fromJson(Map<String, dynamic> json) => CategorySection(
        v: json["_v"] == null ? null : json["_v"],
        type: typeValues.map[json["_type"]],
        resourceState: json["_resource_state"] == null ? null : json["_resource_state"],
        catalogId: catalogIdValues.map[json["catalog_id"]],
        categories: json["categories"] == null ? null : List<CategorySection>.from(json["categories"].map((x) => CategorySection.fromJson(x))),
        creationDate: DateTime.parse(json["creation_date"]),
        id: json["id"],
        lastModified: DateTime.parse(json["last_modified"]),
        link: json["link"],
        online: json["online"],
        pageDescription: json["page_description"] == null ? null : Page.fromJson(json["page_description"]),
        pageKeywords: json["page_keywords"] == null ? null : Page.fromJson(json["page_keywords"]),
        pageTitle: json["page_title"] == null ? null : Page.fromJson(json["page_title"]),
        cEnableCompare: json["c_enableCompare"] == null ? null : json["c_enableCompare"],
        cShowInMenu: json["c_showInMenu"] == null ? null : json["c_showInMenu"],
        description: json["description"] == null ? null : Description.fromJson(json["description"]),
        name: json["name"] == null ? null : Description.fromJson(json["name"]),
        parentCategoryId: json["parent_category_id"] == null ? null : parentCategoryIdValues.map[json["parent_category_id"]],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "_v": v == null ? null : v,
        "_type": typeValues.reverse[type],
        "_resource_state": resourceState == null ? null : resourceState,
        "catalog_id": catalogIdValues.reverse[catalogId],
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "creation_date": creationDate!.toIso8601String(),
        "id": id,
        "last_modified": lastModified!.toIso8601String(),
        "link": link,
        "online": online,
        "page_description": pageDescription == null ? null : pageDescription!.toJson(),
        "page_keywords": pageKeywords == null ? null : pageKeywords!.toJson(),
        "page_title": pageTitle == null ? null : pageTitle!.toJson(),
        "c_enableCompare": cEnableCompare == null ? null : cEnableCompare,
        "c_showInMenu": cShowInMenu == null ? null : cShowInMenu,
        "description": description == null ? null : description!.toJson(),
        "name": name == null ? null : name!.toJson(),
        "parent_category_id": parentCategoryId == null ? null : parentCategoryIdValues.reverse[parentCategoryId],
        "thumbnail": thumbnail == null ? null : thumbnail,
    };
}

enum CatalogId { VMM_STOREFRONT_CATALOG }

final catalogIdValues = EnumValues({
    "vmm-storefront-catalog": CatalogId.VMM_STOREFRONT_CATALOG
});

class Description {
    Description({
        this.descriptionDefault,
        this.hiIn,
    });

    String? descriptionDefault;
    String? hiIn;

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        descriptionDefault: json["default"],
        hiIn: json["hi-IN"] == null ? null : json["hi-IN"],
    );

    Map<String, dynamic> toJson() => {
        "default": descriptionDefault,
        "hi-IN": hiIn == null ? null : hiIn,
    };
}

class Page {
    Page({
        this.pageDefault,
    });

    String? pageDefault;

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageDefault: json["default"],
    );

    Map<String, dynamic> toJson() => {
        "default": pageDefault,
    };
}

enum ParentCategoryId { ROOT }

final parentCategoryIdValues = EnumValues({
    "root": ParentCategoryId.ROOT
});

enum Type { CATEGORY }

final typeValues = EnumValues({
    "category": Type.CATEGORY
});

class EnumValues<T> {
  late  Map<String, T> map;
   late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
