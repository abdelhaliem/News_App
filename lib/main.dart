import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit_app.dart';
import 'package:news_app/layout/nwes_layout.dart';
import 'package:news_app/shared/network/local/ceche_helper.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';
import 'package:news_app/tools/colors.dart';
import 'layout/cubit/app_cubit_state.dart';
import 'layout/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final isDark;

  const MyApp(this.isDark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience()
            ..getTechnology()
            ..getHealth()
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..appChangeDarkMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                tabBarTheme: const TabBarTheme(
                  labelColor: ToolsColors.mainColor,
                  unselectedLabelColor: Colors.black,
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  //elevation: 5,
                  backgroundColor: ToolsColors.mainColor,
                ),
                colorScheme: ColorScheme(
                  error: Colors.black,
                  onError: Colors.black,
                  onPrimary: Colors.black,
                  onSecondary: Colors.black,
                  onSurface: Colors.black,
                  primary: Colors.white,
                  secondaryVariant: Colors.black,
                  surface: Colors.black,
                  onBackground: Colors.black,
                  brightness: Brightness.light,
                  background: Colors.white,
                  secondary: Colors.black26,
                  primaryVariant: Colors.grey.shade100,
                ),
                cardTheme: CardTheme(
                  color: Colors.grey.shade50,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: ToolsColors.mainColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                  selectedItemColor: ToolsColors.mainColor,
                  unselectedLabelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                  ),
                  selectedLabelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                  ),
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                ),
                textTheme: const TextTheme(
                    headline1: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(0, 1),
                          )
                        ]),
                    bodyText2: TextStyle(
                      color: ToolsColors.mainColor,
                      fontSize: 18,
                    ),
                    bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            darkTheme: ThemeData(
              tabBarTheme: const TabBarTheme(
                labelColor: ToolsColors.mainColor,
                unselectedLabelColor: Colors.white,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                //elevation: 5,
                backgroundColor: ToolsColors.mainColor,
              ),
              colorScheme: const ColorScheme(
                error: Colors.black,
                onError: Colors.black,
                onPrimary: Colors.black,
                onSecondary: Colors.black,
                onSurface: Colors.black,
                primary: Colors.white,
                secondaryVariant: Colors.black,
                surface: Colors.black,
                onBackground: Colors.black,
                brightness: Brightness.dark,
                background: Colors.black,
                secondary: Colors.white30,
                primaryVariant: Colors.white10,
              ),
              cardTheme: const CardTheme(
                color: Colors.white10,
              ),
              primaryColor: ToolsColors.mainColor,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: ToolsColors.mainColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                      )
                    ]),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                elevation: 0.0,
                selectedItemColor: ToolsColors.mainColor,
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Quicksand',
                ),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'Quicksand',
                ),
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                unselectedIconTheme: IconThemeData(color: Colors.grey),
                showSelectedLabels: true,
              ),
              textTheme: const TextTheme(
                  headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyText2: TextStyle(color: Colors.white, fontSize: 18),
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            title: 'News App',
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
