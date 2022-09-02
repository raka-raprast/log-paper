import 'package:json_annotation/json_annotation.dart';

part 'shift.g.dart';

@JsonSerializable()
class Shift {
  final String shiftTime;
  final String status;
  final int oilBearingTemp;
  final int pressureDisch;
  final int flowRate;
  final int rpm;
  final int coolTemp;
  final int oilTempPressure;
  final int batteryVolt;
  final int fuelRate;
  final String remarkKeterangan;

  Shift({
    this.shiftTime = '',
    this.status = '',
    this.oilBearingTemp = 0,
    this.pressureDisch = 0,
    this.flowRate = 0,
    this.rpm = 0,
    this.coolTemp = 0,
    this.oilTempPressure = 0,
    this.batteryVolt = 0,
    this.fuelRate = 0,
    this.remarkKeterangan = '',
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ShiftToJson(this);

  @override
  List<Object?> get props => [
        shiftTime,
        status,
        oilBearingTemp,
        pressureDisch,
        flowRate,
        rpm,
        coolTemp,
        oilTempPressure,
        batteryVolt,
        fuelRate,
        remarkKeterangan
      ];
}
