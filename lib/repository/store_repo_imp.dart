// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/model/init_response_parser.dart';
import 'package:merchant/model/profile/profile.dart';

import 'package:http/http.dart' as http;
import 'package:merchant/model/store/store.dart';
import 'package:merchant/repository/store_repo.dart';
import 'package:merchant/utils/api_config.dart';

class StoreRepositoryImplementation implements StoreRepository {
  final String ACCOUNT_BASE_URL = API_CONFIG.ACCOUNT_BASE_URL;
  final headers = API_CONFIG.HEADERS;
  final merchant_store_storage = GetStorage('merchant_store_info');
  var client = http.Client();
  final logger = Logger();

  StoreRepositoryImplementation() {}

  @override
  Future<MerchantStoreInfo> getMerchantStoreInfo(
      String? merchantId, String? access_token) async {
    try {
      client = http.Client();
      final url =
          Uri.parse('${ACCOUNT_BASE_URL}/api/v1/merchant/store/${merchantId}');
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
            MerchantStoreInfo.fromJson(jsonResponse["resultObject"]);
        merchant_store_storage.write(
            'merchant_store', jsonResponse["resultObject"]);
      } else {
        parsed_response = new MerchantStoreInfo();
      }
      return parsed_response;
    } on Exception catch (e) {
      bool has = merchant_store_storage.hasData('merchant_store');
      logger.e(has);
      if (e is SocketException) {
        if (merchant_store_storage.hasData('merchant_store')) {
          logger.e('connection lost');
          Map<String, dynamic> merchant_store_info =
              merchant_store_storage.read("merchant_store");
          return MerchantStoreInfo.fromJson(merchant_store_info);
        }
      }
      return new MerchantStoreInfo();
    }
  }
}
