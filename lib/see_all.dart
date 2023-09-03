import 'package:flutter/material.dart';
import 'Streamers.dart';
import 'constants.dart';

Streamers streamers = Streamers();

class SeeAll extends StatelessWidget {
  final String type;
  const SeeAll(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.purple.shade700,
              width: 0.6,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent, //Color(0x80BFCDF5),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.purple.shade700,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFDEDEC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              conditionalColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget conditionalColumn(BuildContext context) {
    if (type == 'TOP STREAMERS')
      return Column(
        children: <Widget>[
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
          const SizedBox(
            height: 80,
          ),
        ],
      );
    if (type == 'Other Best Streamers')
      return Column(
        children: <Widget>[
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
          rowGenerator(
            otherBest(17, 8, context),
            otherBest(18, 9, context),
          ),
          rowGenerator(
            otherBest(19, 10, context),
            otherBest(20, 11, context),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      );
    if (type == 'Growing Streamer') {
      return Column(
        children: <Widget>[
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
          rowGenerator(
            growing(25, 8, context),
            growing(26, 9, context),
          ),
          rowGenerator(
            growing(27, 10, context),
            growing(28, 11, context),
          ),
          rowGenerator(
            growing(29, 12, context),
            growing(30, 13, context),
          ),
          rowGenerator(
            growing(31, 14, context),
            growing(32, 15, context),
          ),
          rowGenerator(
            growing(33, 16, context),
            growing(34, 17, context),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      );
    }
    if (type == 'Influencers/Casters') {
      return Column(
        children: <Widget>[
          rowGenerator(
            caster(25, 0, context),
            caster(26, 1, context),
          ),
        ],
      );
    } else
      return const Center(
        child: Text('Something Went Wrong'),
      );
  }
}
