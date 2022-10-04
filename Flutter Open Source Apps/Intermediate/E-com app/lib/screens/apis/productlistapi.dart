import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:vishal_mega_mart_app/screens/constant.dart';
import 'package:vishal_mega_mart_app/screens/model/productlist.dart';
import 'package:vishal_mega_mart_app/screens/sharedpref.dart';
import '../model/category_section.dart';

class ProductlistyProvider {
  Client client = Client();
  Future<ProductListModel> getallproductlist() async {
    const url ="https://www.vishalmegamart.com/dw/shop/v20_10/product_search?refine_2=cgid=1003001&refine_1=price=(0.01..99999)&start=0&count=35&inventory_ids=HH15_Inventory&expand=images&client_id=9804f8b4-e431-4950-a743-bda22f09ebb8&storeID=HH15&locale=en-IN";
    final mytoken = await appPreferences.getStringPreference("my_token");
    String token = mytoken;
    print("===TOKEN IN API=========");

    print("===TOKEN IN API=====${token}====");
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsondata = jsonDecode(response.body.toString());
    // print("=========${jsondata.length}");

    //return CategorySection.fromJson(jsonDecode(response.body));
    print("=========++++====${response.body.toString()}+++++++++++++++++++");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ProductListModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('=====Failed to load post');
    }
  }
}
