import 'package:vishal_mega_mart_app/screens/apis/categoryapi.dart';
import 'package:vishal_mega_mart_app/screens/apis/lastapi.dart';
import 'package:vishal_mega_mart_app/screens/apis/productlistapi.dart';
import 'package:vishal_mega_mart_app/screens/apis/profuct.dart';
import 'package:vishal_mega_mart_app/screens/apis/subcatapi.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';
import 'package:vishal_mega_mart_app/screens/model/lastmodel.dart';
import 'package:vishal_mega_mart_app/screens/model/product.dart';
import 'package:vishal_mega_mart_app/screens/model/productlist.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';

class Repository {
  final categoryprovider = CategoryProvider();
  Future<CategorySection> getallcategory() => categoryprovider.getcategory();

  final productprovider = ProductProvider();
  Future<ProductModel> getallproducts() => productprovider.product();

final subcatprovider = SUbcatProvider();
  Future<SubCatModel> getallsubcat() => subcatprovider.getsubcat();

  final lastprovider = LatProvider();
  Future<LastModel> getalllast() => lastprovider.getlastapi();

  final productlistprovider = ProductlistyProvider();
  Future<ProductListModel> getallproductlist() => productlistprovider.getallproductlist();

  
}

