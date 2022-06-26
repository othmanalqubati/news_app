import 'dart:math';

import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,position){
      return Card(
        
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              _auther(),
              SizedBox(
                height: 16,
              ),
              _detcard(),
            ],
          ),
        ),
      );
    },
    itemCount: 30,);
  }


 Widget _auther(){
   List <Categories> _arrCategories=<Categories>[];
   _arrCategories.add(Categories('Sport', Colors.teal));
   _arrCategories.add(Categories('LifeStyle', Colors.pink));
   _arrCategories.add(Categories('tech', Colors.blue));
   _arrCategories.add(Categories('tech', Colors.blue));
   _arrCategories.add(Categories('tech', Colors.blue));
   _arrCategories.add(Categories('tech', Colors.redAccent));
   _arrCategories.add(Categories('tech', Colors.yellow));
   _arrCategories.add(Categories('tech', Colors.black38));
   _arrCategories.add(Categories('tech', Colors.blue));
   _arrCategories.add(Categories('tech', Colors.grey));
   _arrCategories.add(Categories('tech', Colors.green));

   Random _random= Random();
   Categories getcategory()
   {
     int randomNumber = _random.nextInt(10); // from 0 upto 99 included
     return _arrCategories[randomNumber];
   }

   return Row (
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images1/img2.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              width: 50,
              height: 50,


            ),

            Column(
              children: [
                Text('Mechaial Adams'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('15 mins'),
                    SizedBox(width: 8,),
                    Text(getcategory()._category,style: TextStyle(color: getcategory()._color))


                  ],
                )
              ],
            )
          ],
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border)),
      ],
    );
  }
}

Widget _detcard() {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(image:DecorationImage(
            image: ExactAssetImage('assets/images1/img3.jpg'),
            fit: BoxFit.cover) ),
        width: 120,
        height: 120,

      ),
      Expanded(
      child:Column(
        children: [
          Padding(
            padding:EdgeInsets.all( 12),
              child: Text('Tech Tent: Old phone and safe social',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),maxLines: 2,textAlign: TextAlign.center,)),
          SizedBox(height: 6,),
          Padding(
            padding: EdgeInsets.only( right: 12,left: 12,bottom: 12),
              child: Text('we c talk talk talk talk talk talk talk talk talk talk talk  about the future future future future future future future future future as work as robort robort robort robort robort robort advanced',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,),maxLines: 8,))

        ],
      ))
    ],
  );
}

class Categories {
  late String _category;
   late  Color _color;



  String get category => _category;

  set category(String value) {
    _category = value;
  }

  Categories(this._category, this._color);

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }


}
