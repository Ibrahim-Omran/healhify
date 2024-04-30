import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/mail/presentation/cubit/mail_cubit/mail_state.dart';
import 'package:url_launcher/url_launcher.dart';

class MailCubit extends Cubit<MailState> {
  MailCubit() : super(MailInitial());

  GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  sendMail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'yossef.abdelgaied@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': subjectController.text.toString(),
        'body': messageController.text.toString(),
      }),
    );
    launchUrl(emailLaunchUri);
    messageController.clear();
    subjectController.clear();
  }
}
