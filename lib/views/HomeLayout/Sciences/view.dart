import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/views/HomeLayout/cubit/cubits.dart';
import 'package:news/views/HomeLayout/cubit/states.dart';
import 'package:news/widgets/article_builder.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getScience(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context).science;
            return ArticleBuilder(cubit);
          }),
    );
  }
}
