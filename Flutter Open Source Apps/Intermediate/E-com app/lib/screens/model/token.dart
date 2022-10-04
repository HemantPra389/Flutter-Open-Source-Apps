// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    TokenModel({
        this.accessToken,
        this.scope,
        this.tokenType,
        this.expiresIn,
    });

    String? accessToken;
    String? scope;
    String? tokenType;
    int? expiresIn;

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json["access_token"],
        scope: json["scope"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "scope": scope,
        "token_type": tokenType,
        "expires_in": expiresIn,
    };
}
