import 'package:url_launcher/url_launcher.dart';

void goToQNTMBodyInstagram() async {
  if (!await launchUrl(Uri.parse('https://www.instagram.com/qntmbody/'))) {
    throw Exception('Could not launch intagram qntmbody');
  }
}
