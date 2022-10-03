
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'holiday_model.g.dart';

@JsonSerializable()
class HolidayModel {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  String? counties;
  int? launchYear;
  String? type;

  HolidayModel(
      {this.date,
        this.localName,
        this.name,
        this.countryCode,
        this.fixed,
        this.global,
        this.counties,
        this.launchYear,
        this.type});


  factory HolidayModel.fromJson(Map<String, dynamic> json) => _$HolidayModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);



}