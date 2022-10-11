import 'dart:convert';

import 'package:http/http.dart';
import 'package:parsedemo2/model/emplist_model.dart';
import 'package:parsedemo2/model/empone_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset-UTF-8'
  };

  /* Http Apis */

  static String API_EMP_LIST = "/api/v1/employees";
  static String API_EMP_ONE = "/api/v1/employee/"; //{id}
  static String API_EMP_CREATE = "/api/v1/create";
  static String API_EMP_UPDATE = "/api/v1/update/"; //{id}
  static String API_EMP_DELETE = "/api/v1/delete/"; //{id}

/*Http Requests*/

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    print(api);
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Emplist parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data = Emplist.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }
}
