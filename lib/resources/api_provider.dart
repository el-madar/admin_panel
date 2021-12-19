import 'dart:async';
import 'dart:convert';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiProvider {
  Future<dynamic> getRequestAPI({required String url, required Map<String, String> headers}) async {

    headers.addAll({
      "Content-type": "application/json",
      "Accept":"application/json",
      "Content-Language": tr('current_language'),
    });

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map data = json.decode(response.body);

        return data['data'];

      }else if (response.statusCode == 401){
        throw MyException(
          messages: [tr('Unauthenticated')],
          error: response.statusCode,
          errorException: 'Unauthenticated',
        );
      } else {
        // If that call was not successful, throw an error.
        throw MyException(
          messages: [tr('errors')],
          error: response.statusCode,
          errorException: 'Errors From States Request !',
        );
      }
    } on TimeoutException catch (e) {
      throw MyException(
        messages: [tr('an_error_occurred_please_try_again')],
        error: 101,
      );
    } on SocketException catch (e) {
      throw MyException(
        messages: [tr('please_check_internet_connection')],
        error: 102,
      );
    }
  }

  Future<dynamic> postRequestAPI(
      {required String url,
      required String body,
      required Map<String, String> headers}) async {
    headers.addAll({
      "Content-type": "application/json",
      "Accept":"application/json",
      "Content-Language": tr('current_language'),
    });

    try {
      final response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map data = json.decode(response.body);
        if (response.statusCode == 201) {
          return data['data'];
        } else {
          // If that call successful, But Have Error throw an error.
          throw MyException(
            messages: data['errors'],
            error: response.statusCode,
            errorException: "Errors Return From Back End !!",
          );
        }
      } else {
        // If that call was not successful, throw an error.
        throw MyException(
          messages: [tr('errors')],
          error: response.statusCode,
          errorException: 'Errors From States Request !',
        );
      }
    } on TimeoutException catch (e) {
      throw MyException(
        messages: [tr('an_error_occurred_please_try_again')],
        error: 101,
      );
    } on SocketException catch (e) {
      throw MyException(
        messages: [tr('please_check_internet_connection')],
        error: 102,
      );
    }
  }
}
