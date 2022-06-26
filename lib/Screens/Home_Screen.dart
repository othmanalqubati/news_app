import 'package:flutter/material.dart';
import 'package:news_app/SharedUi/NavigationDrawer.dart';
import 'package:news_app/HomeTabs/Pobular.dart';
import 'package:news_app/HomeTabs/WhatsNews.dart';
import 'package:news_app/HomeTabs/Favorite.dart';
import 'package:news_app/Api/post_api.dart';
import 'package:news_app/Api/categories_api.dart';
import 'package:news_app/Api/authors_api.dart';
import 'package:news_app/pupoutScreens/About.dart';
import 'package:news_app/pupoutScreens/Contact.dart';
import 'package:news_app/pupoutScreens/Help.dart';
import 'package:news_app/pupoutScreens/Settings.dart';




class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}
enum pupOut{
  Help,About,Contact,Settings
}
class _Home_ScreenState extends State<Home_Screen> with SingleTickerProviderStateMixin {
PostsApi postsApi=new PostsApi();
CategoriesApi categoriesApi=new CategoriesApi();
AuthorsApi authorsApi= AuthorsApi();

   late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    postsApi.fetchCategoryPosts();
    authorsApi.fetchAllAuthors();
    //print('othmandsddddddddddsssssddddds');
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: [
          IconButton(icon:Icon(Icons.search),onPressed: (){}),
          _popUpMenu(context)        ],
        bottom: TabBar(tabs: [
          Tab(text: 'WHATS NEWS'),
          Tab(text: 'POPULAR'),
          Tab(text: 'FAVORITES'),

        ],
          controller: _tabController,

        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        controller: _tabController,
          children: [
               Whatsnews(),
               Pubular(),
               Favorite(),
          ],
        ),
      );

  }
  Widget _popUpMenu(BuildContext context)
  {
    return PopupMenuButton<pupOut>(itemBuilder: (context){
        return [
          const PopupMenuItem<pupOut>(
            value: pupOut.About,
            child: Text('About'),
          ),
          const PopupMenuItem<pupOut>(
            value: pupOut.Contact,
            child: Text('Contact'),
          ),
          const PopupMenuItem<pupOut>(
            value: pupOut.Help,
            child: Text('Help'),
          ),
          const PopupMenuItem<pupOut>(
            value: pupOut.Settings,
            child: Text('Settings'),
          ),
        ];
    }, onSelected: (pupOut menu){
      switch(menu)
      {
        case pupOut.About:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>About() ));
          break;

        case pupOut.Contact:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact() ));
          break;
        case pupOut.Help:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Help() ));
          break;

        case pupOut.Settings:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings() ));
          break;
      }


    },);
  }
}
 