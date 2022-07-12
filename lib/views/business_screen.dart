import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/bloc/news_cubit.dart';
import 'package:newsapp2/bloc/news_cubit.dart';
import 'package:newsapp2/views/screen_compontents/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).business;
        return buildArticleList(list,context);
      },
    );
  }
}
