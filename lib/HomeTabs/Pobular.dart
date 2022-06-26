import 'package:flutter/material.dart';
import 'package:news_app/Api/post_api.dart';
import 'package:news_app/Api/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class Pubular extends StatefulWidget {
  const Pubular({Key? key}) : super(key: key);

  @override
  _PubularState createState() => _PubularState();
}

class _PubularState extends State<Pubular> {
  PostsApi postsApi=PostsApi();
  @override
  Widget build(BuildContext context) {
print('start build pobular');
      return FutureBuilder(
          future: postsApi.fetchPobularApi(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                print('waiting');

                return _loading();

                break;
              case ConnectionState.active:
                print('active');
                return _loading();
              case ConnectionState.none:
              //todo:handle problem
                print('none');
                break;
              case ConnectionState.done:
                if (snapshot.hasError ) {
                  print('you acutallay have an error othmanaaa');
                  //todo:handle error no data found
                }
                  else {
                  if (snapshot.hasData) {
                    print('done with data');
                    List<Post> posts = snapshot.data;
                    Post p=posts[2];
                    print('new oth '+ p.title);
                    return ListView.builder(itemBuilder: (context, position) {
                      return _drawRowTopStories(posts[position]);
                    },
                      itemCount: posts.length,);
                  }
                else {
                    print('you acutallay have an error othmanaaa2');
                    //todo:handle problem ther's error found
                }
                break;
            }

            }   return Container(); });


    }
    

  }
  Widget _drawRowTopStories(Post post) {
    return  Padding(
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
                                      child:  Image.network(
                                          post.featured_image, height: 100,
                            width: 160,
                                        ),
                                       
                                      ),
                                    ),
                                  ]),
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
                                            Text('mechail adres'),
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
  


Widget _loading()
{
  return Container(
      child:Center(
          child: CircularProgressIndicator()
      )
  );
}