import 'package:flutter/material.dart';
import 'Streamers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'constants.dart';
import 'see_all.dart';

Streamers streamers = Streamers();

class MyHomePage extends StatefulWidget {
  static const String id = 'home_screen';

  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    checkStatus();
    return Scaffold(
      backgroundColor: const Color(0xFFFDEDEC),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.purple.shade700,
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Stay Connected',
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'LexendPeta',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black54,
                          ),
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black54,
                          ),
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black54,
                          ),
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                background: Image.asset(
                  'images/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: FutureBuilder(
          future: checkStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                connectionStatus == 'ConnectivityResult.wifi' ||
                connectionStatus == 'ConnectivityResult.mobile') {
              return singleChildScroll();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget categoryCard({required String category}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Card(
          color: Colors.purple.shade700,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAll(category),
                ),
              );
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.purple.shade800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget singleChildScroll() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              categoryCard(category: 'TOP STREAMERS'),
              rowGenerator(
                topStreamers(1, 1, context),
                topStreamers(2, 0, context),
              ),
              rowGenerator(
                topStreamers(3, 2, context),
                topStreamers(4, 3, context),
              ),
              rowGenerator(
                topStreamers(5, 4, context),
                topStreamers(6, 5, context),
              ),
              rowGenerator(
                topStreamers(7, 6, context),
                topStreamers(8, 7, context),
              ),
              categoryCard(category: 'Other Best Streamers'),
              rowGenerator(
                otherBest(9, 0, context),
                otherBest(10, 1, context),
              ),
              rowGenerator(
                otherBest(11, 2, context),
                otherBest(12, 3, context),
              ),
              rowGenerator(
                otherBest(13, 4, context),
                otherBest(14, 5, context),
              ),
              rowGenerator(
                otherBest(15, 6, context),
                otherBest(16, 7, context),
              ),
              categoryCard(category: 'Growing Streamer'),
              rowGenerator(
                growing(17, 0, context),
                growing(18, 1, context),
              ),
              rowGenerator(
                growing(19, 2, context),
                growing(20, 3, context),
              ),
              rowGenerator(
                growing(21, 4, context),
                growing(22, 5, context),
              ),
              rowGenerator(
                growing(23, 6, context),
                growing(24, 7, context),
              ),
              categoryCard(category: 'Influencers/Casters'),
              rowGenerator(
                caster(25, 0, context),
                caster(26, 1, context),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ImageProvider onlineImage(String url) {
    if (connectionStatus == 'ConnectivityResult.mobile' ||
        connectionStatus == 'ConnectivityResult.wifi') {
      return NetworkImage(url);
    } else {
      return const AssetImage('images/avatar.png');
    }
  }
}
