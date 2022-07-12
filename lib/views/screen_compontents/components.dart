import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/core/utlis.dart';
import 'package:newsapp2/views/web_screen.dart';


Widget buildArticleItem(article,context)=>InkWell(
  onTap: () 
  {
    AppNavigator.customNavigator(
        context: context, 
        screen: WebScreen(url: article['url']),
        finish: false,
    );
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),



                ),

              ],

            ),

          ),

        ),



      ],

    ),

  ),
);
Widget buildArticleList(list,context)=>ConditionalBuilder(
    condition: list.length>0,
    builder: (context) =>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context, index)=>Padding(
        padding: const EdgeInsetsDirectional.only(start: 35,end: 35),
        child: Container(
          width: double.infinity,
          height: 1,
          color: Colors.deepOrange,
        ),
      ),
      itemCount: 10,
    ),
    fallback: (context) => Center(child: CircularProgressIndicator()));

