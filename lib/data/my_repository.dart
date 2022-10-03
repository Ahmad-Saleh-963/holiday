


import 'package:holiday/data/model/holiday_model.dart';

import 'fetch/fetch_data.dart';

class Repository{

 final FetchData fetchData ;

Repository(this.fetchData);

Future<List<HolidayModel>> geting(String year , String codeCity)async{


final respon = await fetchData.getData(year , codeCity);

return respon.map((respon)=> HolidayModel.fromJson(respon)).toList();

}


// await To Get Code City And push DropdownMenu
getCityCode()async{
  await fetchData.getCodeCity();
}

}