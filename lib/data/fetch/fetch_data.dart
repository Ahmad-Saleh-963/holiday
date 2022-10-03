// ignore: depend_on_referenced_packages
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:holiday/viewScreens/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/constants.dart';
import '../../viewScreens/home_view.dart';


class FetchData{

late Dio dio ;

FetchData(){
  BaseOptions options = BaseOptions(
  receiveDataWhenStatusError: true,
 connectTimeout: 10*1000,
 receiveTimeout: 10*100,
  );

  dio=Dio(options);

}

// Get Api Holiday and Convert to obj HolidayModel
Future<List<dynamic>> getData(String year , String codeCity)async{
try{
 Response response = await dio.get("${Constants.baseUrlData}/$year/$codeCity");
 return response.data;
}catch(e){return [];}
}



// Get Date From Api Code City And Save in SharedPreferences
getCodeCity() async{
  Dio dio = Dio();

  try{
    var response = await dio.get(Constants.UrlCountry);
    var a = response.data["Data"];
    a.forEach((element) {
      HomeView.listSearch.add(element['CountryName']);
      HomeView.listCodeCity.add(element['DHS_CountryCode']);
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('listSearch',HomeView.listSearch);
    await sharedPreferences.setStringList('listCodeCity',HomeView.listCodeCity);

  }catch(e){return [];}

}



}