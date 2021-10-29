import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/modules/details_view/details_screen.dart';

import '../colors.dart';

Widget buildCard(article, BuildContext context) {
  return InkWell(
    onTap: () {
      navigateTo(
        context,
        DetailsScreen(
          title: article['title'],
          author: article['author'],
          description: article['description'],
          pageUrl: article['url'],
          publishedAt: article['publishedAt'],
          urlToImage: article['urlToImage'],
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            article['urlToImage'] == null
                ? Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.image,
                      size: 100,
                      color: Colors.grey.shade200,
                    )),
                  )
                : Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage("${article['urlToImage']}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: const TextStyle(
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
    ),
  );
}

Widget buildArticle(list, context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildCard(list[index], context),
      separatorBuilder: (context, index) => const Divider(
        color: ToolsColors.mainColor,
        endIndent: 20,
        indent: 20,
      ),
      itemCount: list.length,
    );

void navigateTo(context, widget) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildNoConnected(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/noconnect.png',
            width: 300,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
         const Text('Please make sure you are connected to the Internet',
          textAlign: TextAlign.center,
            style: TextStyle(
            color: ToolsColors.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Quicksand'
          ),
          ),

      ],
    ),
  );
}
