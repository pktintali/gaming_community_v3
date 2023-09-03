import 'package:flutter/material.dart';
import 'package:indian_gaming_community/profile.dart';
import 'dart:io';

var connectionStatus = 'Unknown';

List<String> favName = [];
List<String> favLogo = [];
List<String> favUrl = [];
List<String> favDisc = [];
List<String> favInsta = [];
List<String> favFb = [];
List<String> favTwit = [];

Future checkStatus() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      connectionStatus = 'ConnectivityResult.wifi';
    }
  } on SocketException catch (_) {
    print('not connected');
  }
}

Widget favWidget(
    {required String name,
    required String logo,
    required BuildContext context,
    String? tag,
    String? status,
    String? url,
    String? disc,
    String? insta,
    String? fb,
    String? twitter}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      rowCard(
        name: name,
        logo: logo,
        context: context,
        tag: tag,
        status: status,
        twit: twitter,
        insta: insta,
        fb: fb,
        disc: disc,
        url: url,
      ),
    ],
  );
}

ImageProvider statusImage(String logo, String status) {
  if (status == 'ConnectivityResult.mobile' ||
      status == 'ConnectivityResult.wifi') {
    return NetworkImage(logo);
  } else {
    return const AssetImage('images/avatar.png');
  }
}

Expanded rowCard({
  required String name,
  required String logo,
  required BuildContext context,
  String? url,
  String? tag,
  String? status,
  String? insta,
  String? fb,
  String? twit,
  String? disc,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(
                url: url,
                tag: tag,
                status: status,
                name: name,
                logo: logo,
                fb: fb,
                insta: insta,
                disc: disc,
                twit: twit,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: statusImage(logo, status ?? ''),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget rowGenerator(Widget a, Widget b) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      a,
      b,
    ],
  );
}

Widget topStreamers(int t, int f, BuildContext context) {
  return rowCard(
    context: context,
    status: connectionStatus,
    tag: '$t',
    name: streamers.topStreamer[f],
    logo: '${streamers.topStreamerLogo[f]}',
    url: streamers.topStreamersUrl[f],
    disc: streamers.topStreamerDiscord[f],
    fb: streamers.topStreamerFb[f],
    insta: streamers.topStreamerInsta[f],
    twit: streamers.topStreamerTwitter[f],
  );
}

Widget otherBest(int t, int f, BuildContext context) {
  return rowCard(
      context: context,
      status: connectionStatus,
      tag: '$t',
      name: streamers.otherBestStreamer[f],
      logo: '${streamers.otherBestStreamerLogo[f]}',
      url: streamers.otherBestStreamerUrl[f],
      disc: streamers.otherBestStreamerDiscord[f],
      fb: '',
      insta: streamers.otherBestStreamerInsta[f],
      twit: streamers.otherBestStreamerTwitter[f]);
}

Widget growing(int t, int f, BuildContext context) {
  return rowCard(
      context: context,
      status: connectionStatus,
      tag: '$t',
      name: streamers.growingStreamer[f],
      logo: '${streamers.growingStreamerLogo[f]}',
      url: streamers.growingStreamerUrl[f],
      disc: streamers.growingStreamerDiscord[f],
      fb: '',
      insta: '',
      twit: '');
}

Widget caster(int t, int f, BuildContext context) {
  return rowCard(
      context: context,
      status: connectionStatus,
      tag: '$t',
      name: streamers.caster[f],
      logo: '${streamers.casterLogo[f]}',
      url: streamers.casterUrl[f],
      disc: streamers.casterDiscord[f],
      fb: '',
      insta: '',
      twit: '');
}
