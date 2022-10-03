// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

import '../data/model/holiday_model.dart';
import '../data/my_repository.dart';


part 'holiday_state.dart';

class MyCubit extends Cubit<MyState> {
  final Repository repository ;
 late List<HolidayModel> holidays ;

  MyCubit(this.repository) : super(MyInitial());



  emitGetAllHolidays(String year , String codeCity)async{
   emit(Loding());
   holidays = await repository.geting(year ,codeCity);
   emit(GetAllHolidyas(holidays));
  }



  emitLodingCodeCity()async{
   await repository.getCityCode();
  }


}


