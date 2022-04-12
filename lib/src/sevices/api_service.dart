import 'dart:convert';
import 'package:flutter_task_esp/src/sevices/api_service_modal.dart';
import 'package:http/http.dart' as http_client;

import 'package:flutter_task_esp/src/static_value.dart';

class DbServices {
  getapi(api, {headers}) async {
    try {
      final response = await http_client.get(
        Uri.parse('${Overrides.apiBaseUrl}$api'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ResponseModel(statusCode: response.statusCode, data: data);
      } else {
        if (response.body == 'Unauthorized') {
          ResponseModel _res = await getapi(api, headers: headers);
          return _res;
        }
        return ResponseModel(statusCode: response.statusCode, data: null);
      }
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        throw ('NO_CONNECTION');
      } else {
        rethrow;
      }
    }
  }

  postapi(api, {body, headers}) async {
    try {
      final response = await http_client.post(
          Uri.parse('${Overrides.apiBaseUrl}$api'),
          body: json.encode(body));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ResponseModel(statusCode: response.statusCode, data: data);
      } else {
        if (response.body == 'Unauthorized') {
          ResponseModel _res = await postapi(api, body: body, headers: headers);
          return _res;
        }
        final data = json.decode(response.body);
        return ResponseModel(statusCode: response.statusCode, data: data);
      }
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        throw ('NO_CONNECTION');
      } else {
        rethrow;
      }
    }
  }
}
