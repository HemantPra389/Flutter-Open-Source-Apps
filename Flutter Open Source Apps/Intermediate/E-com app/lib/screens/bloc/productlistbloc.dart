import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:vishal_mega_mart_app/screens/apis/repository.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';
import 'package:vishal_mega_mart_app/screens/model/productlist.dart';

class ProductListBloc {
  final _repository = Repository();
  final _productlistfetcher = PublishSubject<ProductListModel>();

  Stream<ProductListModel> get allproductlist => _productlistfetcher.stream;

  fetchallproductlist() async {
    ProductListModel productListModel = await _repository.getallproductlist();
    _productlistfetcher.sink.add(productListModel);
  }

  dispose() {
    _productlistfetcher.close();
  }
}

final bloc = ProductListBloc();
