import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishal_mega_mart_app/screens/constant.dart';
import 'package:vishal_mega_mart_app/screens/home.dart';
import 'package:vishal_mega_mart_app/screens/model/token.dart';
import 'package:vishal_mega_mart_app/screens/sharedpref.dart';
import 'package:vishal_mega_mart_app/screens/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var TOKEN;
  var firstLogin;
  Future<TokenModel> Token() async {
    // ignore: avoid_print
    print(
      "======= API CALLING  =========",
    );
    // const token = tokens.TOKEN;
    var headers = {
      'Authorization':
          'Basic OTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4OlZNTU1vYmlsZUFwcDIwMjAj',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          'route=1660200976.763.118.455900|b4b9366450a28a63ee5f72b7d8464f5c'
    };

    var request = http.Request('POST',
        Uri.parse('https://account.demandware.com/dwsso/oauth2/access_token'));
    request.bodyFields = {'grant_type': 'client_credentials'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    Map valueMap = json.decode(res);

    dynamic Token = valueMap.remove('access_token');

    TokenValue.mytoken = Token;

    TOKEN = Token;

    final jwt = Token;
    

     await appPreferences.saveStringPreference("my_token", jwt);
    print("+++++777jwt7777+++++${jwt}+++++++++++++");
    if (response.statusCode == 200) {
      //print("=======Product====== ${res}");
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      // print("======= Failed to load posts =========");
    }

    return TokenModel.fromJson(jsonDecode(res));
  }

  void updatevalue() {
    TokenValue.mytoken = TOKEN;
     print("+++++ TTTTTTTTTT+++++${firstLogin}+++++++++++++");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("+++++Token in init state+++++${firstLogin}+++++++++++++");
    updatevalue();
    Token();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}

class TokenValue {
  static var mytoken;
}

  // addStringToSF() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('stringValue', TokenValue.mytoken);
  //   }

  
