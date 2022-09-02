import 'package:json_annotation/json_annotation.dart';

part 'dnd.g.dart';

@JsonSerializable()
class Dnd {
  final String title;
  final int oilBearingTemp;
  final int pressureDisch;
  final int flowRate;
  final int rpm;
  final int coolTemp;
  final String oilTempPressure;
  final int batteryVolt;
  final int fuelRate;

  Dnd({
    required this.title,
    required this.oilBearingTemp,
    required this.pressureDisch,
    required this.flowRate,
    required this.rpm,
    required this.coolTemp,
    required this.oilTempPressure,
    required this.batteryVolt,
    required this.fuelRate,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Dnd.fromJson(Map<String, dynamic> json) => _$DndFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DndToJson(this);

  @override
  List<Object?> get props => [
        title,
        oilBearingTemp,
        pressureDisch,
        flowRate,
        rpm,
        coolTemp,
        oilTempPressure,
        batteryVolt,
        fuelRate
      ];
}
