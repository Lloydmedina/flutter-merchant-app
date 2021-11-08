import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:merchant/utils/env.dart';

class API_CONFIG extends GetxController {
  // PRODUCTION | DEVELOPMENT | STAGING
  Build BUILD_TYPE = Build.DEVELOPMENT;
  static String ACCOUNT_BASE_URL = "";
  static String OTHER_SERVICE_BASE_URL = "";
  static String DRIVER_WALLET_ID = "";
  static String CLOUDINARY_API_KEY = "";
  static String CLOUDINARY_API_SECRET = "";
  static String CLOUDINARY_CLOUDNAME = "";
  static final HEADERS = <String, String>{"Content-Type": "application/json"};
  static final HEADERS_WITH_BEARER = <String, String>{
    "Content-Type": "application/json"
  };

  API_CONFIG({required this.BUILD_TYPE}) {
    print("Initializing API Base URL");
    this.setBaseURL(this.BUILD_TYPE);
  }

  void setBaseURL(Build build_type) {
    switch (this.BUILD_TYPE) {
      case Build.PRODUCTION:
        API_CONFIG.ACCOUNT_BASE_URL = '$production_base_url';
        API_CONFIG.CLOUDINARY_API_KEY = '$cloudinary_api_key';
        API_CONFIG.CLOUDINARY_API_SECRET = "$cloudinary_api_secret";
        API_CONFIG.CLOUDINARY_CLOUDNAME = "$cloudinary_cloud_name";
        API_CONFIG.OTHER_SERVICE_BASE_URL =
            "$production_other_service_base_url";
        API_CONFIG.DRIVER_WALLET_ID = "$production_wallet_id";

        print("Current Build: PRODUCTION");
        break;
      case Build.DEVELOPMENT:
        API_CONFIG.ACCOUNT_BASE_URL = '$development_base_url';
        API_CONFIG.CLOUDINARY_API_KEY = '$cloudinary_api_key';
        API_CONFIG.CLOUDINARY_API_SECRET = "$cloudinary_api_secret";
        API_CONFIG.CLOUDINARY_CLOUDNAME = "$cloudinary_cloud_name";
        API_CONFIG.OTHER_SERVICE_BASE_URL =
            "$development_other_service_base_url";
        API_CONFIG.DRIVER_WALLET_ID = "$development_wallet_id";

        print("Current Build: DEVELOPMENT");
        break;
      case Build.STAGING:
        API_CONFIG.ACCOUNT_BASE_URL = '$staging_base_url';
        API_CONFIG.CLOUDINARY_API_KEY = '$cloudinary_api_key';
        API_CONFIG.CLOUDINARY_API_SECRET = "$cloudinary_api_secret";
        API_CONFIG.CLOUDINARY_CLOUDNAME = "$cloudinary_cloud_name";
        API_CONFIG.OTHER_SERVICE_BASE_URL = "$staging_other_service_base_url";
        API_CONFIG.DRIVER_WALLET_ID = "$staging_wallet_id";

        print("Current Build: STAGING");
        break;
      default:
    }
  }
}

enum Build { DEVELOPMENT, PRODUCTION, STAGING }
