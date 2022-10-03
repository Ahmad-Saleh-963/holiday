// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:holiday/cubit/holiday_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/screens/holidayPage.dart';

import 'data/fetch/fetch_data.dart';
import 'data/my_repository.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Repository repsstory;
  late MyCubit myCubit;

  _MyAppState(){
    repsstory = Repository(FetchData());
    myCubit = MyCubit(repsstory);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BlocProvider(
        create: (_)=>MyCubit(repsstory),
        child: const HomeScreen(),
      ),
    );
  }


}