// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:vishal_mega_mart_app/screens/constant.dart';
// import 'package:vishal_mega_mart_app/screens/model/token.dart';

// class TokenProvider {
//   //Client client = Client();
//   Future<TokenModel> Token() async {
//     // ignore: avoid_print
//     print(
//       "======= API CALLING  =========",
//     );

//     var headers = {
//       'Authorization':
//           'Basic OTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4OlZNTU1vYmlsZUFwcDIwMjAj',
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Cookie':
//           'route=1660200976.763.118.455900|b4b9366450a28a63ee5f72b7d8464f5c'
//     };

//     var request = http.Request('POST',
//         Uri.parse('https://account.demandware.com/dwsso/oauth2/access_token'));
//     request.bodyFields = {'grant_type': 'client_credentials'};
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();
//     final res = await response.stream.bytesToString();
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print(response.reasonPhrase);
//     }

//     print("=======Product====== ${res}");
//     if (response.statusCode == 200) {
//       print("=======Product====== ${res}");
//       // print("============= ${await response.stream.bytesToString()}");
//     } else {
//       print("======= Failed to load posts =========");
//     }

//     return TokenModel.fromJson(jsonDecode(res));
//   }
// }
