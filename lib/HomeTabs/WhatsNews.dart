
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/post_api.dart';
import 'dart:async';
import 'package:news_app/Api/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';


class Whatsnews extends StatefulWidget {
  const Whatsnews({Key? key}) : super(key: key);

  @override
  _WhatsnewsState createState() => _WhatsnewsState();
}
PostsApi postsApi=PostsApi();

class _WhatsnewsState extends State<Whatsnews> {
  @override
  Widget build(BuildContext context) {
    postsApi.fetchWhatsnewApi();
    print('othman');

    return SingleChildScrollView(
      child :Column(
            children: <Widget>[
              _drawHeader(),
              _drawTopStories(),
              _drawRecentStories(),

              SizedBox(
                height: 24,
              )
            ],
          )
    );



  }

  Widget _drawHeader() {
    print('othman test');
    postsApi.fetchWhatsnewApi();
    TextStyle HeaderTitle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20);
    TextStyle HeaderDesc = TextStyle(color: Colors.white, fontSize: 15);

    return FutureBuilder(
        future: postsApi.fetchWhatsnewApi(),
        builder:(context,AsyncSnapshot snapshot){
          switch(snapshot.connectionState)
          {
            case ConnectionState.none:
            //Todo:Handle problem
              print('none');
              break;

            case ConnectionState.active:
              print('active');
              break;
            case ConnectionState.waiting:
              print('wating');
              return _loading();
              break;
            case ConnectionState.done:
              print('done');
              if(snapshot.error !=null)
              {
                print('done with error');
                //Todo:handle problem no data
              }
              else{
                if(snapshot.hasData)
                {
                  print('done with data');
                  Post post1=snapshot.data[0];
                  Post post2=snapshot.data[1];
                  Post post3=snapshot.data[2];

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(post1.featured_image),  //
                            fit: BoxFit.fill)),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 60, right: 60, bottom: 12),
                                child: Text(
                                  post1.title,
                                  style: HeaderTitle,
                                  textAlign: TextAlign.center,
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 60, right: 60),
                                child: Text(
                                  post1.content,
                                  //'othman alqubaati faor travelling and doing whatever Dessssssc',
                                  style: HeaderDesc,
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        )),
                  );

                }
                else
                {
                  //Todo:handle no data
                }
              }
              break;

          }
          return Container();

        });
  }
}

Widget _drawTopStories() {
  return FutureBuilder(
      future: postsApi.fetchApiByCategory("3") ,
      builder: (context,AsyncSnapshot snapshot) {
        switch(snapshot.connectionState)
        {
          case ConnectionState.waiting:
               return _loading();
            break;
          case ConnectionState.active:
            return _loading();
            break;
          case ConnectionState.none:
            //Todo:Handle problem
            break;
          case ConnectionState.done:
            if(snapshot.error !=null)
              {
                //Todo:handle problem no data
              }
            else{
              if(snapshot.hasData)
                {

                  Post post1=snapshot.data[0];
                  Post post2=snapshot.data[1];
                  Post post3=snapshot.data[2];
                  Post post4=snapshot.data[3];
                  return Container(
                    padding: EdgeInsets.all(2),
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _title('top stories'),
                                ],
                              ),
                              _drawRowTopStories(post1),
                              _drawRowTopStories(post2),
                              _drawRowTopStories(post3),
                              _drawRowTopStories(post4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              else
                {
                  //Todo:handle no data
                }
            }
            break;

        }
        return Container();
      });

}
Widget _drawRecentStories(){
  return FutureBuilder(
      future: postsApi.fetchWhatsnewApi(),
      builder: (context,AsyncSnapshot snapshot){
        switch(snapshot.connectionState)
        {
          case ConnectionState.waiting:
            return _loading();
            break;
          case ConnectionState.active:
            return _loading();
            break;
          case ConnectionState.none:
            //ToDo:Handle problem
            break;
          case ConnectionState.done:
            if(snapshot.error!=null)
              {
                //Todo:handle problem error found
              }
            else
              if(snapshot.hasData)
                {
                  Post post1=snapshot.data[0];
                  Post post2=snapshot.data[1];
                  Post post3=snapshot.data[2];
                  return Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 24, left: 8),
                                child: _title(
                                  'recent stories',
                                )),

                          ]),
                      _drawRowRecentStories(post1),
                      _drawRowRecentStories(post2),
                      _drawRowRecentStories(post3),
                    ],
                  );
                }
              else
                {
                  //Todo:handle No data found
                }

            break;
        }
        return Container();
      });


}

Widget _drawRowTopStories(Post post) {
  return Padding(
    padding: EdgeInsets.only(
      left: 0,
    ),
    child: Card(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Expanded(
                  child: Image.network(
                    (
                      post.featured_image
                    ),
                    height: 100,
                    width: 160,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Text(
                        post.content,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(post.user_id),
                        Row(children: [
                          Icon(
                            Icons.timer,
                          ),
                          Text(_parseHumanDateTime(post.date_written))
                        ]),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

String _parseHumanDateTime(String dateTime)
{
  DateTime dateTime1=DateTime.parse(dateTime);

  var date=DateTime.now();   //now time
    Duration dif=date.difference(dateTime1);  //duration time
    var difference=DateTime.now().subtract(dif);//subtract now time with given time
    return timeago.format(difference);
}

Widget _drawRowRecentStories(Post post) {
  return Padding(
    padding: EdgeInsets.only(top: 24),
    child: Card(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                image:DecorationImage(
                    image: NetworkImage(post.featured_image),  //
                    fit: BoxFit.fill)),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
              decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(top: 16,bottom: 8,left: 8),

              child: Padding(
                padding: EdgeInsets.only(left: 24,right: 24,top: 2,bottom: 2),
                child: Text(
                  'sport',
                  style:
                  TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w700),

                ),

              ),
            ),],
          ),
Padding(
    padding: EdgeInsets.only(right: 16,left: 16,top: 8,bottom: 8),
          child:Text(post.content,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,),maxLines: 3,),
    ),
          Row(
            children: [
              Icon(Icons.timer),
              Text(_parseHumanDateTime(post.date_written)),
            ],
          )
        ],
      ),
    ),
  );

}

Widget _title(String title) {
  return Padding(
      padding: EdgeInsets.only(left: 4, top: 8, bottom: 8),
      child: Text(title,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          )));
}


Widget _loading()
{
  return Container(
    child:Center(
     child: CircularProgressIndicator()
    )
  );
}
