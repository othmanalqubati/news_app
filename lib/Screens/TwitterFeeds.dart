import 'package:flutter/material.dart';
import 'package:news_app/SharedUi/NavigationDrawer.dart';

class TwitterFeeds extends StatefulWidget {
  const TwitterFeeds({Key? key}) : super(key: key);

  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Card(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: [_headCard(),
                _bodyCard(),
                _drawLine(),
                _tailCard()
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}

Widget _headCard() {
  return Padding(
    padding: EdgeInsets.only(left: 12, right: 8, top: 8),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('assets/images1/img1.jpg'),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Todys favorite food',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '@othman_qubati',
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'feb 12.2022',
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Widget _bodyCard() {
  return Container(
      margin: EdgeInsets.all(16),
      child: Expanded(
        child: Text(
          'the favorite food was so expinsive of many reasons which starts of the global war,the favorite food was so expinsive of many reasons which starts of the global war between rusal and others' +
              '.',
          style: TextStyle(fontSize: 14),
          maxLines: 6,
          textAlign: TextAlign.center,
        ),
      ));
}
Widget _drawLine(){
  return Container(
    height: 1,
    color: Colors.grey.shade100,
  );
}
Widget _tailCard() {
  return Container(
      child: Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.repeat,
                color: Colors.deepPurple,
              )),
          Transform.translate(
            offset: Offset(-12,0),
            child: Text(
              '123',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('BUY TICKETS'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
            TextButton(
              child: const Text('LISTEN'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ),
  ));
}
