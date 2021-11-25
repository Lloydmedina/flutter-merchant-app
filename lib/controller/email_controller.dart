import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:merchant/model/email/email_response.dart';
import 'package:merchant/repository/email_repo.dart';
import 'package:merchant/repository/email_repo_imp.dart';

class EmailController extends GetxController {
  ProfileController profile = Get.find<ProfileController>();
  EmailServicesImplementaion emailservices =
      Get.find<EmailServicesImplementaion>();
  EmailServicesResponse email_response = new EmailServicesResponse();
  EmailController();
  sendToEmali() async {
    final box = GetStorage();

    String? access_token = box.read("accessToken");
    String? receipientEmail = profile.merchant_info.value.email;
    String? receipientName = profile.merchant_info.value.firstName! +
        ' ' +
        profile.merchant_info.value.lastName!;
    String? subject = '';
    String? header = '';
    String? body = '';
    String? linkUrl = 'https://passafood.co';

    final get_email_response = await emailservices.emailServices(
        receipientEmail,
        receipientName,
        subject,
        header,
        body,
        linkUrl,
        access_token);

    email_response = get_email_response;
  }
}
