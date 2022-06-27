
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';


class FirebaseDynamicLinkService{

static Future<String> createDynamicLink(bool  short,uid) async{
    String _linkMessage;

final dynamicLinkParams = DynamicLinkParameters(
  link: Uri.parse("https://newblingo/user?id=${uid}"),
  uriPrefix: "https://newblingo.page.link",
  androidParameters:  const AndroidParameters(
    packageName: "com.example.blingo2",
    minimumVersion: 0,
  ), 
);
final dynamicLink =
    await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    var shortlink = dynamicLink.shortUrl;
    print(shortlink);

return shortlink.toString();
}}

