import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_challenge/request/api_const.dart';

class APICall {
  Future getRandomTrivia() async {
    Response response;
    response = await Dio().get(ApiConst.randomTrivia);

    var data = await json.decode(json.encode(response.data));

    return data;

    // Map<String, String> headers = {'Content-Type': 'application/json'};
    // return await http.get(Uri.parse(APIConst.baseURL), headers: headers);
  }

  Future getRandomDate() async {
    Response response;
    response = await Dio().get(ApiConst.randomDate);

    var data = await json.decode(json.encode(response.data));
    return data;

  }
  Future getRandomMath() async {
    Response response;
    response = await Dio().get(ApiConst.randomMath);

    var data = await json.decode(json.encode(response.data));
    return data;

  }
}