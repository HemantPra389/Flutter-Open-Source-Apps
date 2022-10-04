import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:vishal_mega_mart_app/screens/apis/repository.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';
import 'package:vishal_mega_mart_app/screens/model/lastmodel.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';

class LastBloc {
  final _repository = Repository();
  final _lastfetcher = PublishSubject<LastModel>();

  Stream<LastModel> get alllastapi => _lastfetcher.stream;

  fetchalllast() async {
    LastModel lastModel = await _repository.getalllast();
    _lastfetcher.sink.add(lastModel);
  }

  dispose() {
    _lastfetcher.close();
  }
}

final bloc = LastBloc();
