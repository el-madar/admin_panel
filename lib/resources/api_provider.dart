import 'dart:async';
import 'dart:convert';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiProvider {

  Future<dynamic> getRequestAPI({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'ok') {
          return data['articles'];
        } else {
          // If that call successful, But Have Error throw an error.
          throw MyException(
            message: data['message'].toString(),
            error: data["status"],
            errorException: "Errors Return From Back End !!",
          );
        }
      } else {
        // If that call was not successful, throw an error.
        throw MyException(
          message: data['message'],
          error: response.statusCode,
          errorException: 'Errors From States Request !',
        );
      }
    } on TimeoutException catch (e) {
      throw MyException(
        message: tr('an_error_occurred_please_try_again'),
        error: 101,
        errorException: e.message,
      );
    } on SocketException catch (e) {
      throw MyException(
        message: tr('please_check_internet_connection'),
        error: 102,
        errorException: e.message,
      );
    }
  }

}
