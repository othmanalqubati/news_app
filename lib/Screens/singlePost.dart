import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({Key? key}) : super(key: key);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Post Details'),
            backgroundColor: Colors.red,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images1/img3.jpg',fit: BoxFit.cover,),


            ),
          ),
        ],
      ),

    );
  }
}
