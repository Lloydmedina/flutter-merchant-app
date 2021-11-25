import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:merchant/model/email/email_response.dart';
import 'package:merchant/model/init_response_parser.dart';
import 'package:merchant/repository/email_repo.dart';
import 'package:merchant/utils/api_config.dart';

class EmailServicesImplementaion implements EmailServicesRepository {
  final String ACCOUNT_BASE_URL = API_CONFIG.ACCOUNT_BASE_URL;
  final headers = API_CONFIG.HEADERS;
  var client = http.Client();
  final logger = Logger();
  EmailServicesImplementaion() {}
  @override
  Future<EmailServicesResponse> emailServices(
      String? receipientEmail,
      String? receipientName,
      String? subject,
      String? header,
      String? body,
      String? linkUrl,
      String? access_token) async {
    try {
      client = http.Client();

      final url = Uri.parse(
          '${ACCOUNT_BASE_URL}/api/v1/email/sendemailtemplate/${receipientEmail}/${receipientName}/${subject}/${header}/${body}/${linkUrl}');
      final response = await client.get(url, headers: {
        ...headers,
        'Authorization': 'Bearer ${access_token}',
      });
      final res = response.body;
      client.close();
      late var parsed_response;
      InitResponseParser init_parsed =
          InitResponseParser.fromJson(json.decode(res));
      if (init_parsed.resultEnum == "Success") {
        var jsonResponse = json.decode(res);
        parsed_response =
            EmailServicesResponse.fromJson(jsonResponse["resultObject"]);
      } else {
        parsed_response = new EmailServicesResponse();
      }
      return parsed_response;
    } on Exception catch (e) {
      return new EmailServicesResponse();
    }
  }
}
