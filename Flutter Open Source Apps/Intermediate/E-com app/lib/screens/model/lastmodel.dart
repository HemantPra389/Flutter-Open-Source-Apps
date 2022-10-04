// To parse this JSON data, do
//
//     final lastModel = lastModelFromJson(jsonString);

import 'dart:convert';

LastModel lastModelFromJson(String str) => LastModel.fromJson(json.decode(str));

String lastModelToJson(LastModel data) => json.encode(data.toJson());

class LastModel {
    LastModel({
        this.v,
        this.type,
        this.resourceState,
        this.catalogId,
        this.categories,
        this.creationDate,
        this.id,
        this.lastModified,
        this.link,
        this.name,
        this.online,
        this.pageDescription,
        this.pageKeywords,
        this.pageTitle,
        this.parentCategoryId,
        this.thumbnail,
        this.cEnableCompare,
        this.cShowInMenu,
    });

    String? v;
    String? type;
    String? resourceState;
    String? catalogId;
    List<LastModel>? categories;
    DateTime? creationDate;
    String? id;
    DateTime? lastModified;
    String? link;
    Name? name;
    bool? online;
    Page? pageDescription;
    Page? pageKeywords;
    Page? pageTitle;
    String? parentCategoryId;
    String? thumbnail;
    bool? cEnableCompare;
    bool? cShowInMenu;

    factory LastModel.fromJson(Map<String, dynamic> json) => LastModel(
        v: json["_v"] == null ? null : json["_v"],
        type: json["_type"],
        resourceState: json["_resource_state"] == null ? null : json["_resource_state"],
        catalogId: json["catalog_id"],
        categories: json["categories"] == null ? null : List<LastModel>.from(json["categories"].map((x) => LastModel.fromJson(x))),
        creationDate: DateTime.parse(json["creation_date"]),
        id: json["id"],
        lastModified: DateTime.parse(json["last_modified"]),
        link: json["link"],
        name: Name.fromJson(json["name"]),
        online: json["online"],
        pageDescription: Page.fromJson(json["page_description"]),
        pageKeywords: Page.fromJson(json["page_keywords"]),
        pageTitle: Page.fromJson(json["page_title"]),
        parentCategoryId: json["parent_category_id"],
        thumbnail: json["thumbnail"],
        cEnableCompare: json["c_enableCompare"],
        cShowInMenu: json["c_showInMenu"],
    );

    Map<String, dynamic> toJson() => {
        "_v": v == null ? null : v,
        "_type": type,
        "_resource_state": resourceState == null ? null : resourceState,
        "catalog_id": catalogId,
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "creation_date": creationDate!.toIso8601String(),
        "id": id,
        "last_modified": lastModified!.toIso8601String(),
        "link": link,
        "name": name!.toJson(),
        "online": online,
        "page_description": pageDescription!.toJson(),
        "page_keywords": pageKeywords!.toJson(),
        "page_title": pageTitle!.toJson(),
        "parent_category_id": parentCategoryId,
        "thumbnail": thumbnail,
        "c_enableCompare": cEnableCompare,
        "c_showInMenu": cShowInMenu,
    };
}

class Name {
    Name({
        this.nameDefault,
        this.hiIn,
    });

    String? nameDefault;
    String? hiIn;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        nameDefault: json["default"],
        hiIn: json["hi-IN"],
    );

    Map<String, dynamic> toJson() => {
        "default": nameDefault,
        "hi-IN": hiIn,
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
