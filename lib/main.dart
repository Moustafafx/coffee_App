import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubites/getdatadrinks/cubit/drinkes_cubit.dart';
import 'package:flutter_app/screen/Home_Screen.dart';
import 'package:flutter_app/screen/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>DrinkesCubit(Dio())  ..getdrinks("hot")
        ),
     
      ],
      child:MyApp() ,
    )
     );
   
  FlutterError.onError = (details) {
    print('Flutter error: ${details.exceptionAsString()}');
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
return MaterialApp(

debugShowCheckedModeBanner: false,
theme: ThemeData(
  scaffoldBackgroundColor: Color(0XFF212325),
),
home:welcome_screen(),
);
  }




}