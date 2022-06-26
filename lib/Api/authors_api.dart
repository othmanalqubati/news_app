import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/Api/author_model.dart';
import 'package:news_app/Utilities/api_utilities.dart';
import 'dart:developer';


class AuthorsApi{
    String allAuthorsApi=base_api+ all_authors_api;
  Future <List<Author>> fetchAllAuthors() async{
    List<Author> authors=<Author>[];
      var response=await http.get(Uri.parse(allAuthorsApi));
      if(response.statusCode==200)
        {
          var jsonData=jsonDecode(response.body);
          var data=jsonData('data');
          for(var item in data)
            {
             Author author=new Author(item['id'].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
            //  Author author=new Author(item['id'], item['name'], item['email'], item['avatar']);

              authors.add(author);

            }
        }
      else {
        throw Exception("falied to load");
      }
      for(Author author in authors)
        {
          print('email-'+author.email);
          stderr.writeln('print me');
          debugPrint('othmfdsssssssdddddsssssssssssssssssan');

        }
    /*List<Author> authors=<Author>[];
    var response= await http.get(Uri.parse(allAuthorsApi));
    if(response.statusCode==200)
      {
        var jsonData = jsonDecode(response.body);
        var data = jsonData('data');
        print('dataaaaaaaaaa'+data);

      }
    else{
      print('nnnooooonon');
    }
*/

    print('othmfdsssssssdddddsssssssssssssssssan1111');

    return authors;


  }
}