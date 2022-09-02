import 'package:json_annotation/json_annotation.dart';
part 'ongoing.g.dart';

@JsonSerializable()
class Ongoing {
  final String shift;
  final String tahun;
  final String bulan;
  final String tanggal;
  final String customer;
  final String noPompa;
  final String hmAwal;
  final String lokasi;

  Ongoing({
    required this.shift,
    required this.tahun,
    required this.bulan,
    required this.tanggal,
    required this.customer,
    required this.noPompa,
    required this.hmAwal,
    required this.lokasi,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Ongoing.fromJson(Map<String, dynamic> json) =>
      _$OngoingFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$OngoingToJson(this);

  @override
  List<Object?> get props =>
      [shift, tahun, bulan, tanggal, customer, noPompa, hmAwal, lokasi];
}
