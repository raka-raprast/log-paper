// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ongoing _$OngoingFromJson(Map<String, dynamic> json) => Ongoing(
      shift: json['shift'] as String,
      tahun: json['tahun'] as String,
      bulan: json['bulan'] as String,
      tanggal: json['tanggal'] as String,
      customer: json['customer'] as String,
      noPompa: json['noPompa'] as String,
      hmAwal: json['hmAwal'] as String,
      lokasi: json['lokasi'] as String,
    );

Map<String, dynamic> _$OngoingToJson(Ongoing instance) => <String, dynamic>{
      'shift': instance.shift,
      'tahun': instance.tahun,
      'bulan': instance.bulan,
      'tanggal': instance.tanggal,
      'customer': instance.customer,
      'noPompa': instance.noPompa,
      'hmAwal': instance.hmAwal,
      'lokasi': instance.lokasi,
    };
