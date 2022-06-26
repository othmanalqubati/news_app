import 'package:flutter/material.dart';
import 'package:news_app/SharedUi/NavigationDrawer.dart';

class FacebookFeeds extends StatefulWidget {
  const FacebookFeeds({Key? key}) : super(key: key);

  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  TextStyle _hashtagStyle=TextStyle(color: Colors.deepPurple.shade400,fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feeds'),
        centerTitle: false,
        actions: [
          IconButton(icon:Icon(Icons.search),onPressed: (){}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder: (context,position){
        return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _headerCard(),
                _titleCard(),
                _tagCard(),
                _bodyCard(),
                _drawLine(),
                _tailCard(),
              ],
            )


        );
      }),
    );
  }


  Widget _headerCard()
  {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(-36,0),
                        child: Text(
                          'feb 12.2022',
                          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),

          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.grey,)),
              Transform.translate(
                  offset: Offset(-12,0),
                  child: Text('25',style: TextStyle(fontSize: 12,color:Colors.grey.shade300),)),

            ],
          ),

        ],
      ),
    );


  }
  Widget _titleCard()
  {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text('we also would be dealing with robots,we also would be dealing with robots,we also would be dealing with robots,we also would be dealing with robots,we also would be dealing with robots',
        style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
    );
  }
  Widget _tagCard()
  {
    return Wrap(
      children: [
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle)),
        FlatButton(onPressed: (){}, child: Text('#transport_so_heigh',style: _hashtagStyle))
      ],
    );
  }
  Widget _bodyCard()
  {

    return Padding(
      padding: EdgeInsets.only(left: 24,right: 24,top: 12,bottom: 16),
      child: SizedBox(
          width: double.infinity,
          child: Image(image: ExactAssetImage('assets/images1/img1.jpg'),fit: BoxFit.cover,)),
    );

  }
  Widget _drawLine(){
    return Container(
      height: 1,
      color: Colors.grey.shade100,
    );
  }
  Widget _tailCard()
  {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                TextButton(
                  onPressed: () {},
                  child: Text('10 Comments',style: _hashtagStyle,),
                ),
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
                    child:  Text('Share', style: _hashtagStyle,),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child:  Text('Open',style: _hashtagStyle,),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ));
  }
}