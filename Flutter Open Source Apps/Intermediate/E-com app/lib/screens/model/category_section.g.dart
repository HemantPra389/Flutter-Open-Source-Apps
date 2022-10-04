// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'category_section.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// CategorySection _$CategorySectionFromJson(Map<String, dynamic> json) =>
//     CategorySection(
//       V: json['_v'] as String?,
//       Type: json['_type'] as String?,
//       ResourceState: json['_resource_state'] as String?,
//       catalogId: json['catalog_id'] as String?,
//       categories: (json['categories'] as List<dynamic>?)
//           ?.map((e) => Categorie.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       creationDate: json['creation_date'] as String?,
//       id: json['id'] as String?,
//       lastModified: json['last_modified'] as String?,
//       link: json['link'] as String?,
//       online: json['online'] as bool?,
//       pageDescription: json['page_description'] == null
//           ? null
//           : PageDescription.fromJson(
//               json['page_description'] as Map<String, dynamic>),
//       pageKeywords: json['page_keywords'] == null
//           ? null
//           : PageKeywords.fromJson(
//               json['page_keywords'] as Map<String, dynamic>),
//       pageTitle: json['page_title'] == null
//           ? null
//           : PageTitle.fromJson(json['page_title'] as Map<String, dynamic>),
//       cEnableCompare: json['c_enableCompare'] as bool?,
//       cShowInMenu: json['c_showInMenu'] as bool?,
//     );

// Map<String, dynamic> _$CategorySectionToJson(CategorySection instance) =>
//     <String, dynamic>{
//       '_v': instance.V,
//       '_type': instance.Type,
//       '_resource_state': instance.ResourceState,
//       'catalog_id': instance.catalogId,
//       'categories': instance.categories,
//       'creation_date': instance.creationDate,
//       'id': instance.id,
//       'last_modified': instance.lastModified,
//       'link': instance.link,
//       'online': instance.online,
//       'page_description': instance.pageDescription,
//       'page_keywords': instance.pageKeywords,
//       'page_title': instance.pageTitle,
//       'c_enableCompare': instance.cEnableCompare,
//       'c_showInMenu': instance.cShowInMenu,
//     };

// Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
//       Type: json['_type'] as String?,
//       catalogId: json['catalog_id'] as String?,
//       creationDate: json['creation_date'] as String?,
//       description: json['description'] == null
//           ? null
//           : Description.fromJson(json['description'] as Map<String, dynamic>),
//       id: json['id'] as String?,
//       lastModified: json['last_modified'] as String?,
//       link: json['link'] as String?,
//       name: json['name'] == null
//           ? null
//           : Name.fromJson(json['name'] as Map<String, dynamic>),
//       online: json['online'] as bool?,
//       pageDescription: json['page_description'] == null
//           ? null
//           : PageDescription.fromJson(
//               json['page_description'] as Map<String, dynamic>),
//       pageKeywords: json['page_keywords'] == null
//           ? null
//           : PageKeywords.fromJson(
//               json['page_keywords'] as Map<String, dynamic>),
//       pageTitle: json['page_title'] == null
//           ? null
//           : PageTitle.fromJson(json['page_title'] as Map<String, dynamic>),
//       parentCategoryId: json['parent_category_id'] as String?,
//       thumbnail: json['thumbnail'] as String?,
//       cEnableCompare: json['c_enableCompare'] as bool?,
//       cShowInMenu: json['c_showInMenu'] as bool?,
//     );

// Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
//       '_type': instance.Type,
//       'catalog_id': instance.catalogId,
//       'creation_date': instance.creationDate,
//       'description': instance.description,
//       'id': instance.id,
//       'last_modified': instance.lastModified,
//       'link': instance.link,
//       'name': instance.name,
//       'online': instance.online,
//       'page_description': instance.pageDescription,
//       'page_keywords': instance.pageKeywords,
//       'page_title': instance.pageTitle,
//       'parent_category_id': instance.parentCategoryId,
//       'thumbnail': instance.thumbnail,
//       'c_enableCompare': instance.cEnableCompare,
//       'c_showInMenu': instance.cShowInMenu,
//     };

// Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
//       defaults: json['default'] as String?,
//     );

// Map<String, dynamic> _$DescriptionToJson(Description instance) =>
//     <String, dynamic>{
//       'default': instance.defaults,
//     };

// Name _$NameFromJson(Map<String, dynamic> json) => Name(
//       defaults: json['default'] as String?,
//       hi_IN: json['hi-IN'] as String?,
//     );

// Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
//       'default': instance.defaults,
//       'hi-IN': instance.hi_IN,
//     };

// PageDescription _$PageDescriptionFromJson(Map<String, dynamic> json) =>
//     PageDescription(
//       defaults: json['default'] as String?,
//     );

// Map<String, dynamic> _$PageDescriptionToJson(PageDescription instance) =>
//     <String, dynamic>{
//       'default': instance.defaults,
//     };

// PageKeywords _$PageKeywordsFromJson(Map<String, dynamic> json) => PageKeywords(
//       defaults: json['default'] as String?,
//     );

// Map<String, dynamic> _$PageKeywordsToJson(PageKeywords instance) =>
//     <String, dynamic>{
//       'default': instance.defaults,
//     };

// PageTitle _$PageTitleFromJson(Map<String, dynamic> json) => PageTitle(
//       defaults: json['default'] as String?,
//     );

// Map<String, dynamic> _$PageTitleToJson(PageTitle instance) => <String, dynamic>{
//       'default': instance.defaults,
//     };
