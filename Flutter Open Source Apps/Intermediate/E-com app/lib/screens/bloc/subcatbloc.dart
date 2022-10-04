import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:vishal_mega_mart_app/screens/apis/repository.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';

class SubCatBloc {
  final _repository = Repository();
  final _Subcategoryfetcher = PublishSubject<SubCatModel>();

  Stream<SubCatModel> get allsubcategory => _Subcategoryfetcher.stream;

  fetchallSubcategory() async {
    SubCatModel subCatModel = await _repository.getallsubcat();
    _Subcategoryfetcher.sink.add(subCatModel);
  }

  dispose() {
    _Subcategoryfetcher.close();
  }
}

final bloc = SubCatBloc();
