import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/tools/colors.dart';
import 'package:news_app/tools/widgets/componets.dart';

class DetailsScreen extends StatelessWidget {
  final title;
  final author;
  final description;
  final pageUrl;
  final urlToImage;
  final publishedAt;

  const DetailsScreen({
    this.title,
    this.author,
    this.description,
    this.pageUrl,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              navigateTo(
                  context,
                  WebViewScreen(
                    url: pageUrl,
                    title: title,
                  ));
            },
            label: Text(
              'Visit the news page',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    image: urlToImage == null
                        ? DecorationImage(
                            image: AssetImage('assets/images/news.png'),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage(urlToImage),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey.shade100.withOpacity(0.2),
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronLeft,
                                    color: ToolsColors.mainColor,
                                    //size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: Text(
                              title != null ? "$title" : "",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        textAlign(context: context, title: 'News details :'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: textAlign(
                              context: context,
                              title: description == null ?  "":'$description'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              publishedAt != null ? '$publishedAt' : "",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget textAlign({title, required BuildContext context}) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
