// ignore: depend_on_referenced_packages
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/viewScreens/widget/viewData.dart';
import 'package:holiday/viewScreens/widget/viewLoading.dart';

import '../core/constant/colors.dart';
import '../core/constant/constants.dart';
import '../core/constant/fontStyle.dart';
import '../cubit/holiday_cubit.dart';
import '../data/model/holiday_model.dart';
import '../viewScreens/home_view.dart';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeView homeView = HomeView();
  List<HolidayModel> holidayList = [];
  initData() async {
    await homeView.getSherdPref();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HomeView.listCodeCity = await sharedPreferences.getStringList('listCodeCity') ??  [];
    HomeView.listSearch = await  sharedPreferences.getStringList('listSearch') ?? [];

    if(HomeView.listSearch.isEmpty || HomeView.listCodeCity.isEmpty){
      BlocProvider.of<MyCubit>(context).emitLodingCodeCity();
    }
     BlocProvider.of<MyCubit>(context).emitGetAllHolidays(homeView.selectedDropdown, homeView.countryCode);
   }



  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.green300,
          title: Text("Holidays", style: MyFontStyle.title),
          centerTitle: true,
        ),
        body: BlocBuilder<MyCubit, MyState>(builder: (context, state) {
          if (state is GetAllHolidyas) {
            holidayList = (state).allHolidayList; // myList
            holidayList.isEmpty
                ? homeView.isData = false
                : homeView.isData = true;
            return ViewData(homeView, holidayList);
          } else if (state is Loding)  {
            return const ViewLoading();
          }
          else{return Container();}
        }),
      ),
    );
  }


}
