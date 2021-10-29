import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/tools/colors.dart';
import 'package:news_app/tools/widgets/componets.dart';

class HealthScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return  BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).health;
        return list.isEmpty
            ?  Center(
            child: buildNoConnected(context))
            : buildArticle(list,context);
      },
    );
  }
}
