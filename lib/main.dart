import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/cubit/shop_cubit.dart';

import 'layout/shop_layout.dart';
import 'modules/login_screen.dart';
import 'modules/onboarding_screen.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'shared/Bloc_Observe.dart';
import 'shared/component/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  DioHelper.init();
  Bloc.observer = MyBlocObserver();
   onboarding = CacheHelper.getData(key: 'onboardin');
    print(onboarding);

  token = CacheHelper.getData(key: 'token');
  //print(token);
  Widget widget;
  if (onboarding !=null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  //  print(onboarding);
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  //final bool onboarding;
  MyApp(this.startWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()..getHomeData()..getCategoryData()..getUserData(),
        ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: Color.fromARGB(255, 76, 144, 175),
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 76, 144, 175),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromARGB(255, 76, 144, 175),
            elevation: 20,
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              //     statusBarIconBrightness: Brightness.dark,
            ),
          ),

          // useMaterial3: true,
        ),
        home: startWidget,
      ),
    );
  }
}
