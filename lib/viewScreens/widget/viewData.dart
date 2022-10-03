import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/fontStyle.dart';
import '../../cubit/holiday_cubit.dart';
import '../../data/model/holiday_model.dart';
import '../home_view.dart';

class ViewData extends StatefulWidget {
  late HomeView homeView;
  late List<HolidayModel> holidayList;

  ViewData(this.homeView, this.holidayList);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  int i = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(16.0),
          margin: const EdgeInsetsDirectional.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownSearch<String>(
                  enabled: true,


                  dropdownDecoratorProps: const DropDownDecoratorProps(

                      dropdownSearchDecoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gapPadding: 8,
                        borderSide: BorderSide(
                          color: Colors.green,
                          style: BorderStyle.solid,
                          width: 3,

                        ),),

                  ),

                  ),
                  popupProps:  PopupProps.menu(
                    disabledItemFn: (String s) => s.startsWith('Brazil'),
                    showSearchBox: true,
                    showSelectedItems: true,
                  ),
                  items: HomeView.listSearch,

                  onChanged: (e) async {
                    widget.homeView.country = e.toString();
                    await widget.homeView.getCodeCity(e.toString());
                    // ignore: use_build_context_synchronously
                    BlocProvider.of<MyCubit>(context).emitGetAllHolidays(
                        widget.homeView.selectedDropdown, widget.homeView.countryCode);
                    widget.homeView.setSherdPref();
                  },
                  selectedItem: widget.homeView.country,
                ),
              ),
              const SizedBox(width: 50),
              Container(
                width: 100,
                padding: const EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(colors: [
                      MyColors.green300,
                      MyColors.green200,
                    ])),
                child: Center(
                  child: DropdownButton<String>(
                    value: widget.homeView.selectedDropdown,
                    onChanged: (value) {
                      //   setState(() {
                      widget.homeView.selectedDropdown = value!;
                      BlocProvider.of<MyCubit>(context).emitGetAllHolidays(
                          widget.homeView.selectedDropdown, widget.homeView.countryCode);
                      widget.homeView.setSherdPref();
                      // });
                    },
                    items: widget.homeView.droupdownItems,
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.homeView.isData
            ? Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsetsDirectional.all(8.0),
                    itemCount: widget.holidayList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.all(4.0),
                        //  color: Colors.amberAccent,
                        child: Card(
                          elevation: 3,
                          shadowColor: MyColors.black,
                          child: Container(
                            padding: const EdgeInsetsDirectional.all(16.0),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                    colors: [
                                  MyColors.green300,
                                  MyColors.green200,
                                ])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date : ${widget.holidayList[index].date}",
                                    style: MyFontStyle.title),
                                const SizedBox(height: 8),
                                Text("Name : ${widget.holidayList[index].name}",
                                    style: MyFontStyle.title),
                                Visibility(
                                  visible: i == index ? true : false, // index,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                          color: Colors.white70, thickness: 2),
                                      Text(
                                          "localName : ${widget.holidayList[index].localName}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text(
                                          "countryCode : ${widget.holidayList[index].countryCode}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text(
                                          "fixed : ${widget.holidayList[index].fixed}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text(
                                          "global : ${widget.holidayList[index].global}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text(
                                          "counties : ${widget.holidayList[index].counties}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text(
                                          "launchYear : ${widget.holidayList[index].localName}",
                                          style: MyFontStyle.body),
                                      const SizedBox(height: 8),
                                      Text("type : ${widget.holidayList[index].type}",
                                          style: MyFontStyle.body),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      //   setState(() {
                                      setState(() {i == index ? {i = -1} : {i = index};});
                                      // });
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        i == index
                                            ? Icon(Icons.unfold_less_outlined,
                                                size: 20, color: MyColors.black)
                                            : const Icon(
                                                Icons.unfold_more,
                                                size: 20,
                                              ),
                                        Text(
                                            i == index
                                                ? "Show Less"
                                                : "Show More",
                                            style: MyFontStyle.showMore),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            : Column(
                children: [
                  Image.asset(
                    "assets/images/empty.png",
                    height: 200,
                  ),
                  Text("لايتوفر بيانات حول هذه المنطقة",
                      style: MyFontStyle.title)
                ],
              ),
      ],
    );
  }
}
