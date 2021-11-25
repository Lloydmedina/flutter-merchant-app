import 'package:merchant/model/email/email_response.dart';

abstract class EmailServicesRepository {
  Future<EmailServicesResponse> emailServices(
      String? receipientEmail,
      String? receipientName,
      String? subject,
      String? header,
      String? body,
      String? linkUrl,
      String? access_token);
}
