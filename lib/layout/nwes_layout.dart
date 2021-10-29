import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/cubit_app.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/tools/colors.dart';
import 'package:news_app/tools/widgets/componets.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        var themeCubit = AppCubit.get(context);
        return SafeArea(
          child: DefaultTabController(
            initialIndex: cubit.currentIndex,
            length: cubit.screens.length,
            child: Scaffold(
                // bottomNavigationBar: BottomNavigationBar(
                //   onTap: (index) {
                //     cubit.changed(index);
                //   },
                //   currentIndex: cubit.currentIndex,
                //   items: cubit.bottomItems,
                // ),
                appBar: AppBar(
                  bottom: TabBar(
                    indicatorColor: ToolsColors.mainColor,
                    isScrollable: true,
                    tabs: cubit.TabView,
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.primaryVariant
                          //     ? Colors.white10
                          //     : Colors.grey.shade100,
                          ),
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.solidMoon,
                        ),
                        onPressed: () {
                          themeCubit.appChangeDarkMode();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 25),
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.search),
                        onPressed: () {
                          navigateTo(context, SearchScreen());
                        },
                      ),
                    ),
                  ],
                  toolbarHeight: 75,
                  flexibleSpace: Container(
                  //  margin: const EdgeInsets.only(right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(6, 6),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                  title: const Text('News App'),
                ),
                body: TabBarView(
                  children: cubit.screens,
                )
                //cubit.screens[cubit.currentIndex],
                ),
          ),
        );
      },
    );
  }
}
