import 'package:flutter/material.dart';
import 'package:news/views/WebView/view.dart';
import 'package:news/widgets/Nav_To.dart';

// ignore: must_be_immutable
class BuildArticleItem extends StatelessWidget {
  var article;
  BuildArticleItem(
    this.article,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
      navigateTo(context, WebViewScreen(article['url']),);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
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
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    )
    );
  }
}
