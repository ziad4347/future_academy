import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_academy/Layout/Cubit/FutureCubit.dart';
import 'package:future_academy/Modules/Registration/Login/Login.dart';
import 'package:future_academy/Shared/Local/Cache_Helper.dart';
import 'package:future_academy/Shared/Styles/Theme.dart';

import 'Modules/OnBoardingScreen/Onboarding.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isonboard=CacheHelper.GetData(key: 'onboard')??false;
  runApp(MyApp(isonboard: isonboard,));
}

class MyApp extends StatelessWidget {
final  bool isonboard;
Widget widget;
  MyApp({Key key,@required this.isonboard}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(isonboard){
     widget=Login();
    }
    else{
      widget=OnBoarding();
    }
    return BlocProvider(
      create: (context)=>FutureCubit(),
      child: MaterialApp(
        theme: lightmode,
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
