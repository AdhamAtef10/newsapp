import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/bloc/news_cubit.dart';
import 'package:newsapp2/views/screen_compontents/components.dart';

class SearchScreen extends StatelessWidget {
  var Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_6_rounded),
                onPressed: ()
                {
                  list.ChangeAppThememode();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: TextStyle(
                    color: list.isDark? Colors.white:Colors.black,
                  ),
                  controller: Search,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isNotEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange, width: 5.0),
                    ),
                    hintText: 'Search',
                      hintStyle:TextStyle(
                        color: list.isDark? Colors.white:Colors.black,
                      )
                  ),
                  onChanged: (value)
                  {
                    list.getSearch(value);
                  },
                ),
              ),
              Expanded(child: buildArticleList(list.search, context))
            ],
          ),
        );
      },
    );
  }
}
