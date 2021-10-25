import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/widgets/build_article_item.dart';
import 'package:news/widgets/my_divider.dart';

// ignore: must_be_immutable
class ArticleBuilder extends StatelessWidget {
  List _list = [];
  bool isSearch;
  ArticleBuilder(this._list, {this.isSearch = false});
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: _list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => BuildArticleItem(_list[index]),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: 10,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
  }
}
