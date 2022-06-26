import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/category_model.dart';
import 'dart:convert';
import 'package:news_app/Utilities/api_utilities.dart';

class CategoriesApi{
  
  Future <List<Category1>> fetchAllCategories() async{
    List<Category1> categories=<Category1>[];
    String allCategories=all_categories_api;
    var response=await http.get(Uri.parse(allCategories));
    if(response==200)
      {
        var jsonData=jsonDecode(response.body);
        var data=jsonData['data'];
        for(var item in data)
          {
            var category=new Category1(item['id'].toString(), item['title'].toString());
           categories.add(category);
          }
      }
    return categories;

    
  }
}