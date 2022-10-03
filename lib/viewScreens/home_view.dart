
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView{
  static List<String> listSearch = [];
  static List<String> listCodeCity = [];
  String selectedDropdown = "";
  String countryCode = "";
  String country = "";
  bool isData = true;



  List<DropdownMenuItem<String>> get droupdownItems {
    List<DropdownMenuItem<String>>  year=[];
    year.clear();
    for (int i = 2000; i <= 2022; i++) {
      year.add(DropdownMenuItem(child: Text("$i"), value: i.toString()));
    }

    return year;
  }

  getCodeCity(String codeCity)async{

    for (int i = 0 ; i < listSearch.length ; i++) {

     if(listSearch[i] == country) {
         countryCode=listCodeCity[i];
         break;
       }

    }



  }


  setSherdPref()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('country',country);
    await sharedPreferences.setString( 'countryCode',countryCode);
    await sharedPreferences.setString('selectedDropdown',selectedDropdown);
  }

  getSherdPref()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    country = sharedPreferences.getString('country') ?? "Egypt";
    countryCode =  sharedPreferences.getString('countryCode') ?? "EG";
    selectedDropdown =  sharedPreferences.getString('selectedDropdown') ?? "2022";
  }


}