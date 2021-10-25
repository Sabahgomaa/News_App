import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/views/Search/cubit/cubit.dart';
import 'package:news/widgets/article_builder.dart';
import 'package:news/widgets/defult_form_field.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context, state) {},
        builder: (context, state) {
          var list = SearchCubit.get(context).search;
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    DefultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'search must not be empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search,
                      onChange: (value) {
                        SearchCubit.get(context).getSearch(value);
                      },
                    ),
                    Expanded(
                      child: ArticleBuilder(
                        list,
                        isSearch: true,
                      ),
                    ),
                  ])));
        });
  }
}
