import 'package:http/http.dart' as http;
import 'package:news_app/Api/post_model.dart';
import 'dart:convert';
import 'package:news_app/Utilities/api_utilities.dart';
import 'dart:io';
import 'dart:developer';

class PostsApi{
 /* Future <List<Post>> fetchAllPosts() async{
    List<Post> categories=<Post>[];
    String allPosts=all_posts_api;
    var response=await http.get(Uri.parse(allPosts));
    if(response==200)
    {
      var jsonData=jsonDecode(response.body);
      var data=jsonData['data'];
      for(var item in data)
      {
        var category=new Post(item['id'].toString(), item['title'].toString(),
            item['content'].toString(), item['date_written'].toString(), item['featured_image'].toString(),
            item['votes_up'],item['votes_down'], item['user_id'],item['category_id']);
        categories.add(category);
      }
    }
    return categories;


  }*/

  Future <List<Post>> fetchCategoryPosts() async{
    List<Post> categories=<Post>[];
    String allPosts=base_api+all_posts_api;
    var response=await http.get(Uri.parse(allPosts));
    if(response.statusCode==200)
    {
      var jsonData=jsonDecode(response.body);
      var data=jsonData['data'];
      for(var item in data)
      {
         var category=new Post(id:item['id'].toString(),
            title:item['title'].toString(),
            content:item['content'].toString(),
            date_written:['date_written'].toString(),
            featured_image:item['featured_image'].toString(),
            votes_up:item['votes_up'].toString(),
            votes_down:item['votes_down'].toString(),
            user_id:item['user_id'].toString(),
            category_id:item['category_id'].toString());
        categories.add(category);
      }
      print(categories[3]);
    }


    for(Post post in categories)
      {
        log('email-'+post.title);
      }
    return categories;


  }

  Future<List<Post>> fetchWhatsnewApi()  async{
    print('othman test 1');
    List<Post> wahtsnewApi=<Post>[];
    String whatsnew=base_api+whats_new_api;
    var response=await http.get(Uri.parse(whatsnew));
    if(response.statusCode==200)
      {
        var jsonData=jsonDecode(response.body);
        var data=jsonData['data'];
        for(var item in data)
          {
            Post post=Post(id: item['id'].toString(),
                title: item['title'].toString(),
                content: item['content'].toString(),
                date_written: item['date_written'].toString(),
                featured_image: item['featured_image'].toString(),
                votes_up: item['votes_up'].toString(),
                votes_down: item['votes_down'].toString(),
                user_id: item['user_id'].toString(),
                category_id:item['category_id'].toString() );
            wahtsnewApi.add(post);
          }
      }
    else{
    }

    print('hello othan'+ wahtsnewApi[1].title);
    return wahtsnewApi;

  }

  Future<List<Post>> fetchPobularApi() async{
    List<Post> pobularApi=<Post>[];
    String whatsnew=base_api+pobular_api;
    var response=await http.get(Uri.parse(whatsnew));
    if(response.statusCode==200)
    {
      var jsonData=jsonDecode(response.body);
      var data=jsonData['data'];
      for(var item in data)
      {
        Post post=Post(id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            date_written: item['date_written'].toString(),
            featured_image: item['featured_image'].toString(),
            votes_up: item['votes_up'].toString(),
            votes_down: item['votes_down'].toString(),
            user_id: item['user_id'].toString(),
            category_id:item['category_id'].toString() );
        pobularApi.add(post);
      }
    }
    else{
    }

    return pobularApi;

  }

  Future<List<Post>> fetchApiByCategory(String id) async{
    List<Post> wahtsnewApi=<Post>[];
    String whatsnew=base_api+api+id;
    var response=await http.get(Uri.parse(whatsnew));
    if(response.statusCode==200)
    {
      var jsonData=jsonDecode(response.body);
      var data=jsonData['data'];
      for(var item in data)
      {
        Post post=Post(id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            date_written: item['date_written'].toString(),
            featured_image: item['featured_image'].toString(),
            votes_up: item['votes_up'].toString(),
            votes_down: item['votes_down'].toString(),
            user_id: item['user_id'].toString(),
            category_id:item['category_id'].toString() );
        print('hello othman'+ post.title);
        wahtsnewApi.add(post);
      }
    }
    else{
    }

    return wahtsnewApi;

  }

}