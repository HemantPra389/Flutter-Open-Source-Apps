import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:vishal_mega_mart_app/screens/apis/repository.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';

class CategoryBloc {
  final _repository = Repository();
  final _categoryfetcher = PublishSubject<CategorySection>();

  Stream<CategorySection> get allcategory => _categoryfetcher.stream;

  fetchallcategory() async {
    CategorySection categorySection = await _repository.getallcategory();
    _categoryfetcher.sink.add(categorySection);
  }

  dispose() {
    _categoryfetcher.close();
  }

}

final bloc = CategoryBloc();
