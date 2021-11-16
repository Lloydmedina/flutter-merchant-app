import 'package:merchant/model/profile/profile.dart';

abstract class ProfileRepository {
  Future<MerchantProfile> getMerchantInfo(String? userid, String? access_token);
}
