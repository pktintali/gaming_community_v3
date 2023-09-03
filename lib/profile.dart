import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'Streamers.dart';

Streamers streamers = Streamers();
int fav = 0;

class Profile extends StatefulWidget {
  final String name;
  final String? url;
  final String? tag;
  final status;
  final String? logo;
  final String? insta;
  final String? fb;
  final String? twit;
  final String? disc;
  Profile(
      {required this.name,
      this.url,
      this.tag,
      this.status,
      this.logo,
      this.insta,
      this.fb,
      this.twit,
      this.disc});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  double? _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: const Color(0xFFFDDDEC),
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 26.0,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 240,
                      child: Material(
                        color: Colors.purple.shade700,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(130.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 100.0,
                              backgroundImage: imgData(widget.logo),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation: const Offset(0, -0.5),
                      child: RawMaterialButton(
                        elevation: 10.0,
                        splashColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.white,
                        onPressed: () async {
                          if (Platform.isAndroid) {
                            AndroidIntent intent = AndroidIntent(
                              action: 'action_view',
                              data: '${widget.url}/join',
                            );
                            await intent.launch();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                          child: Text(
                            'JOIN',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF5600E8),
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    'Social Media',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'LexendPeta'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                            action: 'action_view',
                            data: widget.url,
                          );
                          await intent.launch();
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Image.asset(
                        'images/icons/yt3d.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                            action: 'action_view',
                            data: widget.fb,
                          );
                          await intent.launch();
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Image.asset(
                        'images/icons/fb3d.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                            action: 'action_view',
                            data: widget.insta,
                          );
                          await intent.launch();
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Image.asset(
                        'images/icons/insta3d.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                            action: 'action_view',
                            data: widget.twit,
                          );
                          await intent.launch();
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Image.asset(
                        'images/icons/twit3d.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                            action: 'action_view',
                            data: widget.disc,
                          );
                          await intent.launch();
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Image.asset(
                        'images/icons/ds3d.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider imgData(String? url) {
    if ((widget.status == 'ConnectivityResult.mobile' ||
            widget.status == 'ConnectivityResult.wifi') &&
        url != null) {
      return NetworkImage(url);
    } else {
      return const AssetImage('images/avatar.png');
    }
  }
}
