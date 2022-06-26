import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/NavMenu.dart';
import 'package:news_app/Screens/FacebookFeeds.dart';
import 'package:news_app/Screens/HeadLineNews.dart';
import 'package:news_app/Screens/Home_Screen.dart';
import 'package:news_app/Screens/InstgramFeeds.dart';
import 'package:news_app/Screens/TwitterFeeds.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {


  List<NavMenu> navMenu=[
    NavMenu('Explore',()=> Home_Screen()),
    NavMenu('HeadLineNews', ()=> HeadLineNews()),
    NavMenu('Twitter Feeds', ()=> TwitterFeeds()),
    NavMenu('Instgram Feeds', ()=> InstgramFeeds()),
    NavMenu('Facebook Feeds', ()=> FacebookFeeds()),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView.builder(itemBuilder: (context,position){
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
          child:Text('News Options') ,
        );
      return ListTile(
        title:Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(navMenu[position].title)),
        trailing: Icon(Icons.chevron_right),
        onTap: (){
          Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return navMenu[position].destinatoin();
           },
           ));

        },
      );
    },
    itemCount: navMenu.length,
    ),
    );}

}
class Tile{
  late Icon _icon;
  late String _title;

  Tile(this._icon, this._title);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Icon get icon => _icon;

  set icon(Icon value) {
    _icon = value;
  }
}


