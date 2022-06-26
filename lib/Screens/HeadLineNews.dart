import 'package:flutter/material.dart';
import 'package:news_app/HomeTabs/Favorite.dart';
import 'package:news_app/HomeTabs/Pobular.dart';
import 'package:news_app/HomeTabs/WhatsNews.dart';
import 'package:news_app/SharedUi/NavigationDrawer.dart';
class HeadLineNews extends StatefulWidget {
  const HeadLineNews({Key? key}) : super(key: key);

  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
      _tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeadLine'),
        centerTitle: false,
        actions: [
          IconButton(icon:Icon(Icons.search),onPressed: (){}),
          IconButton(icon:Icon(Icons.more_vert),onPressed: (){}),
        ],
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
          Favorite(),
          Pubular(),
          Favorite(),
        ],
      ),
    );
    ;
  }
}
