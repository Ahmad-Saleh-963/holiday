part of 'holiday_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class Loding  extends MyState{}

class GetAllHolidyas extends MyState {
final List<HolidayModel> allHolidayList;
GetAllHolidyas(this.allHolidayList);

}



