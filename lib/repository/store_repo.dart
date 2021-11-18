import 'package:merchant/model/store/store.dart';

abstract class StoreRepository {
  Future<MerchantStoreInfo> getMerchantStoreInfo(
      String? merchantId, String? access_token);
}
