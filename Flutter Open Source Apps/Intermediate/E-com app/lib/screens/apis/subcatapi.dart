import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:vishal_mega_mart_app/screens/constant.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';
import 'package:vishal_mega_mart_app/screens/sharedpref.dart';
import '../model/category_section.dart';

class SUbcatProvider {
  Client client = Client();
  Future<SubCatModel> getsubcat() async {
    const url =
        "https://www.vishalmegamart.com/s/-/dw/data/v20_10/catalogs/vmm-storefront-catalog/categories/1003";
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
      return SubCatModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('=====Failed to load post');
    }
  }
}
