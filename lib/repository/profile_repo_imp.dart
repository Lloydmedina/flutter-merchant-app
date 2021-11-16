// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:merchant/merchant/merchant.dart';

import 'package:merchant/model/init_response_parser.dart';
import 'package:merchant/model/profile/profile.dart';
import 'package:merchant/repository/profile_repo.dart';

import 'package:http/http.dart' as http;
import 'package:merchant/utils/api_config.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final String ACCOUNT_BASE_URL = API_CONFIG.ACCOUNT_BASE_URL;
  final headers = API_CONFIG.HEADERS;

  var client = http.Client();
  final logger = Logger();

  ProfileRepositoryImplementation() {}

  @override
  Future<MerchantProfile> getMerchantInfo(
      String? userid, String? access_token) async {
    try {
      client = http.Client();
      final url =
          Uri.parse('${ACCOUNT_BASE_URL}/api/v1/merchant/user/${userid}');
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
        parsed_response = Merchant.fromJson(jsonResponse["resultObject"]);
      } else {
        parsed_response = new Merchant();
      }
      return parsed_response;
    } on Exception catch (e) {
      logger.e(e);
      return new MerchantProfile();
    }
  }
}
