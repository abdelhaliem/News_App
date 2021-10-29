import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/tools/colors.dart';
import 'package:news_app/tools/widgets/componets.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
             resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text(
                  'Search',
                  style: TextStyle(
                    color: ToolsColors.mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                bottom: PreferredSize(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryVariant,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 15,
                            )
                          ]),
                      child: TextFormField(
                        cursorColor: ToolsColors.mainColor,
                        cursorRadius: Radius.circular(100),
                        autocorrect: true,
                        onChanged: (value) {
                          NewsCubit.get(context).getSearch(value);
                        },
                        decoration: InputDecoration(
                          // icon: const FaIcon(FontAwesomeIcons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: ToolsColors.mainColor,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              )),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          labelText: 'Type here to search',
                          labelStyle:TextStyle(
                            color: Colors.grey.shade700,
                          ) ,

                          // prefix: FaIcon(FontAwesomeIcons.search),
                        ),
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'search must not be empty ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(80),
                ),
              ),
              //backgroundColor: Colors.grey.shade100,
              body: list.isEmpty? Center(
                child: Image.asset(
                  'assets/images/search.png',
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ): buildArticle(list, context));
        });
  }
}
