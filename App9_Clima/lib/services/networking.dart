import 'dart:convert';

import 'package:http/http.dart';

class NetworkingHelper{

  Future<dynamic> getData(String url) async {
    final response = await get(url);
    if(response.statusCode == 200){
      final data = response.body;
      final decodedData = jsonDecode(data);
      return decodedData;
    }
    else{
      print(response.statusCode);
      return null;
    }
  }
}