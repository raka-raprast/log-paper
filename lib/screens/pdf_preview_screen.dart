// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_paper/function/pdf_preview.dart';
import 'package:log_paper/models/custom_image.dart';
import 'package:log_paper/models/dnd.dart';
import 'package:log_paper/models/ongoing.dart';
import 'package:log_paper/models/profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../models/shift.dart';

Future<void> createPDF(
    BuildContext context,
    List<Shift> shiftList,
    List<Dnd> dndList,
    Ongoing ongoing,
    Profile profile,
    String hmAkhir,
    List<CustomImage> customImage) async {
  List<File> imageList = customImage.map((e) => File(e.customImage!)).toList();
  PdfDocument document = PdfDocument();
  final firstPage = document.pages.add();
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('lib/assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<File> getRotatedImageFile(String path) async {
    final byteData = await rootBundle.load('lib/assets/rotated_table/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  if (imageList.isNotEmpty) {
    final page2 = document.pages.add();
    if (imageList.isNotEmpty) {
      page2.graphics.drawImage(PdfBitmap(imageList[0].readAsBytesSync()),
          Rect.fromLTRB(10, 10, 245, 245));
    }
    if (imageList.length >= 2) {
      page2.graphics.drawImage(PdfBitmap(imageList[1].readAsBytesSync()),
          Rect.fromLTRB(265, 10, 500, 245));
    }
    if (imageList.length >= 3) {
      page2.graphics.drawImage(PdfBitmap(imageList[2].readAsBytesSync()),
          Rect.fromLTRB(10, 265, 245, 500));
    }
    if (imageList.length >= 4) {
      page2.graphics.drawImage(PdfBitmap(imageList[3].readAsBytesSync()),
          Rect.fromLTRB(265, 265, 500, 500));
    }
    if (imageList.length >= 5) {
      page2.graphics.drawImage(PdfBitmap(imageList[4].readAsBytesSync()),
          Rect.fromLTRB(10, 520, 245, 755));
    }
    if (imageList.length >= 6) {
      page2.graphics.drawImage(PdfBitmap(imageList[5].readAsBytesSync()),
          Rect.fromLTRB(265, 520, 500, 755));
    }
  }
  if (imageList.length > 6) {
    final page3 = document.pages.add();
    if (imageList.length >= 7) {
      page3.graphics.drawImage(PdfBitmap(imageList[6].readAsBytesSync()),
          Rect.fromLTRB(10, 10, 245, 245));
    }
    if (imageList.length >= 8) {
      page3.graphics.drawImage(PdfBitmap(imageList[7].readAsBytesSync()),
          Rect.fromLTRB(265, 10, 500, 245));
    }
    if (imageList.length >= 9) {
      page3.graphics.drawImage(PdfBitmap(imageList[8].readAsBytesSync()),
          Rect.fromLTRB(10, 265, 245, 500));
    }
    if (imageList.length >= 10) {
      page3.graphics.drawImage(PdfBitmap(imageList[9].readAsBytesSync()),
          Rect.fromLTRB(265, 265, 500, 500));
    }
    if (imageList.length >= 11) {
      page3.graphics.drawImage(PdfBitmap(imageList[10].readAsBytesSync()),
          Rect.fromLTRB(10, 520, 245, 755));
    }
    if (imageList.length >= 12) {
      page3.graphics.drawImage(PdfBitmap(imageList[11].readAsBytesSync()),
          Rect.fromLTRB(265, 520, 500, 755));
    }
  }
  if (imageList.length > 12) {
    final page4 = document.pages.add();
    if (imageList.length >= 13) {
      page4.graphics.drawImage(PdfBitmap(imageList[12].readAsBytesSync()),
          Rect.fromLTRB(10, 10, 245, 245));
    }
    if (imageList.length >= 14) {
      page4.graphics.drawImage(PdfBitmap(imageList[13].readAsBytesSync()),
          Rect.fromLTRB(265, 10, 500, 245));
    }
    if (imageList.length >= 15) {
      page4.graphics.drawImage(PdfBitmap(imageList[14].readAsBytesSync()),
          Rect.fromLTRB(10, 265, 245, 500));
    }
    if (imageList.length >= 16) {
      page4.graphics.drawImage(PdfBitmap(imageList[15].readAsBytesSync()),
          Rect.fromLTRB(265, 265, 500, 500));
    }
    if (imageList.length >= 17) {
      page4.graphics.drawImage(PdfBitmap(imageList[16].readAsBytesSync()),
          Rect.fromLTRB(10, 520, 245, 755));
    }
    if (imageList.length >= 18) {
      page4.graphics.drawImage(PdfBitmap(imageList[17].readAsBytesSync()),
          Rect.fromLTRB(265, 520, 500, 755));
    }
  }
  if (imageList.length > 18) {
    final page5 = document.pages.add();
    if (imageList.length >= 19) {
      page5.graphics.drawImage(PdfBitmap(imageList[18].readAsBytesSync()),
          Rect.fromLTRB(10, 10, 245, 245));
    }
    if (imageList.length >= 20) {
      page5.graphics.drawImage(PdfBitmap(imageList[19].readAsBytesSync()),
          Rect.fromLTRB(265, 10, 500, 245));
    }
    if (imageList.length >= 21) {
      page5.graphics.drawImage(PdfBitmap(imageList[20].readAsBytesSync()),
          Rect.fromLTRB(10, 265, 245, 500));
    }
    if (imageList.length >= 21) {
      page5.graphics.drawImage(PdfBitmap(imageList[21].readAsBytesSync()),
          Rect.fromLTRB(265, 265, 500, 500));
    }
    if (imageList.length >= 23) {
      page5.graphics.drawImage(PdfBitmap(imageList[22].readAsBytesSync()),
          Rect.fromLTRB(10, 520, 245, 755));
    }
    if (imageList.length >= 24) {
      page5.graphics.drawImage(PdfBitmap(imageList[23].readAsBytesSync()),
          Rect.fromLTRB(265, 520, 500, 755));
    }
  }

  if (imageList.length > 24) {
    final page6 = document.pages.add();
    if (imageList.length >= 25) {
      page6.graphics.drawImage(PdfBitmap(imageList[24].readAsBytesSync()),
          Rect.fromLTRB(10, 10, 245, 245));
    }
    if (imageList.length >= 26) {
      page6.graphics.drawImage(PdfBitmap(imageList[25].readAsBytesSync()),
          Rect.fromLTRB(265, 10, 500, 245));
    }
    if (imageList.length >= 27) {
      page6.graphics.drawImage(PdfBitmap(imageList[26].readAsBytesSync()),
          Rect.fromLTRB(10, 265, 245, 500));
    }
    if (imageList.length >= 28) {
      page6.graphics.drawImage(PdfBitmap(imageList[27].readAsBytesSync()),
          Rect.fromLTRB(265, 265, 500, 500));
    }
    if (imageList.length >= 29) {
      page6.graphics.drawImage(PdfBitmap(imageList[28].readAsBytesSync()),
          Rect.fromLTRB(10, 520, 245, 755));
    }
    if (imageList.length >= 30) {
      page6.graphics.drawImage(PdfBitmap(imageList[29].readAsBytesSync()),
          Rect.fromLTRB(265, 520, 500, 755));
    }
  }

  var firstLogo = await getImageFileFromAssets("logo_ksb.png");
  var oilBearingTemp = await getRotatedImageFile("oil_bearing_temp.png");
  var pressureDisch = await getRotatedImageFile("pressure_disch.png");
  var flowrate = await getRotatedImageFile("flowrate.png");
  var rpm = await getRotatedImageFile("rpm.png");
  var coolTemp = await getRotatedImageFile("cool_temp.png");
  var oilTempPress = await getRotatedImageFile("oil_temp_oil_pressure.png");
  var batteryVolt = await getRotatedImageFile("battery_volt.png");
  var fuelRate = await getRotatedImageFile("fuel_rate.png");
  // var secondLogo = await getImageFileFromAssets("pt_hh_logo_simple.png");
  final firstLogoBytes = firstLogo.readAsBytesSync();
  // final secondLogoBytes = secondLogo.readAsBytesSync();
  String firstLogoImg64 = base64Encode(firstLogoBytes);
  // String secondLogoImg64 = base64Encode(secondLogoBytes);
  //Heading
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(firstLogoImg64), Rect.fromLTRB(8, 8, 120, 55));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(
          base64Encode(oilBearingTemp.readAsBytesSync())),
      Rect.fromLTRB(195, 147.5, 220, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(pressureDisch.readAsBytesSync())),
      Rect.fromLTRB(230, 152.5, 250, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(flowrate.readAsBytesSync())),
      Rect.fromLTRB(265, 152.5, 275, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(rpm.readAsBytesSync())),
      Rect.fromLTRB(302, 167.5, 310, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(coolTemp.readAsBytesSync())),
      Rect.fromLTRB(332, 155, 340, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(oilTempPress.readAsBytesSync())),
      Rect.fromLTRB(360, 148, 380, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(batteryVolt.readAsBytesSync())),
      Rect.fromLTRB(397, 148, 405, 187.5));
  firstPage.graphics.drawImage(
      PdfBitmap.fromBase64String(base64Encode(fuelRate.readAsBytesSync())),
      Rect.fromLTRB(430, 152.5, 438, 187.5));
  firstPage.graphics.drawString("PT. KSB INDONESIA",
      PdfStandardFont(PdfFontFamily.helvetica, 20, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(120, 8, 0, 0));
  firstPage.graphics.drawString("LOG PAPER",
      PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(200, 65, 0, 0));
  firstPage.graphics.drawString("(Time and Monitoring Sheet)",
      PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(170, 85, 0, 0));
  firstPage.graphics.drawString("RENTAL AND SERVICE MINING",
      PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(120, 30, 0, 0));
  firstPage.graphics.drawString(
      "Jl. Mulawarman No. 5 RT. 23 Kel. Manggar Balikpapan 76116, Telp. : +62542 771719-771724, Rental Call Cemter:+628119402547",
      PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.italic),
      bounds: Rect.fromLTRB(80, 55, 0, 0));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 0, 511, 615.2));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 65, 511, 100));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 100, 511, 115));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 115, 511, 130));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 130, 511, 145));

  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 145, 60, 600));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(60, 145, 105, 190));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(105, 145, 150, 190));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(150, 145, 190, 190));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(60, 220, 105, 615.2));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(105, 220, 150, 615.2));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(150, 220, 190, 615.2));

  var horizTableStart = 157.5;

  for (var i = 0; i < 8; i++) {
    horizTableStart = horizTableStart + 32.5;
    firstPage.graphics.drawRectangle(
        pen: PdfPens.black,
        bounds:
            Rect.fromLTRB(horizTableStart, 145, horizTableStart + 32.5, 600));
  }
  firstPage.graphics.drawLine(PdfPens.black, Offset(0, 220), Offset(450, 220));
  firstPage.graphics.drawLine(PdfPens.black, Offset(0, 190), Offset(450, 190));
  firstPage.graphics.drawLine(PdfPens.black, Offset(30, 190), Offset(30, 600));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(450, 145, 511, 220));
  var start = 220.0;
  for (var i = 0; i < 25; i++) {
    start = start + 15.2;
    firstPage.graphics
        .drawLine(PdfPens.black, Offset(0, start), Offset(511, start));
  }
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 617, 511, 707));
  firstPage.graphics
      .drawLine(PdfPens.black, Offset(450, 617), Offset(450, 707));
  var dndValueTableStart = 607.0;
  for (var i = 0; i < 9; i++) {
    dndValueTableStart = dndValueTableStart + 10;
    firstPage.graphics.drawLine(PdfPens.black, Offset(0, dndValueTableStart),
        Offset(450, dndValueTableStart));
  }
  var dndValVerticalStart = 157.7;
  for (var i = 0; i < 8; i++) {
    dndValVerticalStart = dndValVerticalStart + 32.5;
    firstPage.graphics.drawLine(PdfPens.black, Offset(dndValVerticalStart, 627),
        Offset(dndValVerticalStart, 707));
  }
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(0, 710, 511, 761));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(210, 102.5, 220, 112.5));
  firstPage.graphics.drawRectangle(
      pen: PdfPens.black, bounds: Rect.fromLTRB(250, 102.5, 260, 112.5));
  firstPage.graphics.drawString(
      "Day", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(225, 105, 0, 0));
  if (ongoing.shift == "Pagi") {
    firstPage.graphics.drawString(
        "v", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(212.5, 102.5, 0, 0));
  }
  firstPage.graphics.drawString(
      "Night", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(265, 105, 0, 0));
  if (ongoing.shift == "Malam") {
    firstPage.graphics.drawString(
        "v", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(252.5, 102.5, 0, 0));
  }

  firstPage.graphics.drawString(
      "Nama", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(5, 105, 0, 0));
  firstPage.graphics.drawString(
      profile.nama, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(55, 105, 0, 0));
  firstPage.graphics.drawString(
      "ID", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(5, 120, 0, 0));
  firstPage.graphics.drawString(
      profile.id, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(55, 120, 0, 0));
  firstPage.graphics.drawString(
      "Customer", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(5, 135, 0, 0));
  firstPage.graphics.drawString(
      ongoing.customer, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(55, 135, 0, 0));
  double headerStart = 50;
  for (var i = 0; i < 3; i++) {
    if (i != 0) {
      headerStart = headerStart + 150;
    }
    firstPage.graphics.drawString(
        ":", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(headerStart, 105, 0, 0));
    firstPage.graphics.drawString(
        ":", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(headerStart, 120, 0, 0));
    firstPage.graphics.drawString(
        ":", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(headerStart, 135, 0, 0));
  }
  firstPage.graphics.drawString(
      "Shift", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(160, 105, 0, 0));
  firstPage.graphics.drawString(
      "Tanggal", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(160, 120, 0, 0));
  firstPage.graphics.drawString(
      "${ongoing.tanggal}-${ongoing.bulan}-${ongoing.tahun}",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(205, 120, 0, 0));
  firstPage.graphics.drawString(
      "Lokasi", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(160, 135, 0, 0));
  firstPage.graphics.drawString(
      ongoing.lokasi, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(205, 135, 0, 0));
  firstPage.graphics.drawString(
      "No.Pompa", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(310, 105, 0, 0));
  firstPage.graphics.drawString(
      ongoing.noPompa, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(355, 105, 0, 0));
  firstPage.graphics.drawString(
      "HM Awal", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(310, 120, 0, 0));
  firstPage.graphics.drawString(
      ongoing.hmAwal, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(355, 120, 0, 0));
  firstPage.graphics.drawString(
      "HM Akhir", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(310, 135, 0, 0));
  firstPage.graphics.drawString(
      hmAkhir, PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(355, 135, 0, 0));
  firstPage.graphics.drawString(
      "Day", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(5, 200, 0, 0));
  firstPage.graphics.drawString(
      "Night", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(35, 200, 0, 0));
  firstPage.graphics.drawString(
      "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
      bounds: Rect.fromLTRB(210, 200, 0, 0));
  firstPage.graphics.drawString(
      "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(212.5, 200, 0, 0));
  firstPage.graphics.drawString(
      "Bar", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(240, 200, 0, 0));
  firstPage.graphics.drawString(
      "M", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(267.5, 200, 0, 0));
  firstPage.graphics.drawString(
      "3", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(272, 200, 0, 0));
  firstPage.graphics.drawString(
      "/H", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(275, 200, 0, 0));
  firstPage.graphics.drawString(
      "Rpm", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(300, 200, 0, 0));
  firstPage.graphics.drawString(
      "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
      bounds: Rect.fromLTRB(340, 200, 0, 0));
  firstPage.graphics.drawString(
      "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(342.5, 200, 0, 0));
  firstPage.graphics.drawString(
      "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
      bounds: Rect.fromLTRB(375, 200, 0, 0));
  firstPage.graphics.drawString(
      "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(377.5, 200, 0, 0));
  firstPage.graphics.drawString(
      "Volt", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(400, 200, 0, 0));
  firstPage.graphics.drawString(
      "Liter", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(432.5, 200, 0, 0));
  // dnd
  double dndVertStart = 627.5;
  for (var i = 0; i < 8; i++) {
    if (i != 0) {
      dndVertStart = dndVertStart + 10;
    }
    firstPage.graphics.drawString(
        "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
        bounds: Rect.fromLTRB(210, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(212.5, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "Bar", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(240, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "M", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(272.5, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "3", PdfStandardFont(PdfFontFamily.helvetica, 3),
        bounds: Rect.fromLTRB(277.5, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "/H", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(280, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "Rpm", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(305, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
        bounds: Rect.fromLTRB(340, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(342.5, dndVertStart, 0, 0));
    if (i != 3) {
      firstPage.graphics.drawString(
          "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
          bounds: Rect.fromLTRB(375, dndVertStart, 0, 0));
      firstPage.graphics.drawString(
          "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(377.5, dndVertStart, 0, 0));
    }
    firstPage.graphics.drawString(
        "Volt", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(400, dndVertStart, 0, 0));
    firstPage.graphics.drawString(
        "Liter", PdfStandardFont(PdfFontFamily.helvetica, 6),
        bounds: Rect.fromLTRB(432.5, dndVertStart, 0, 0));
  }
  firstPage.graphics.drawString("DND LCC 100 ENGINE PERKIN 1006-6T",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 627.5, 0, 0));
  firstPage.graphics.drawString("DND LCC 150 ENGINER VOLVO TAD1343VE",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 637.5, 0, 0));
  firstPage.graphics.drawString("DND LCC 200 ENGINE VOLVO TAD1643VE",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 647.5, 0, 0));
  firstPage.graphics.drawString("DND LCC 200 ENGINE SCANIA DC16",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 657.5, 0, 0));
  firstPage.graphics.drawString(
      "DND LCC 200 ENGINE CAT C27", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 667.5, 0, 0));
  firstPage.graphics.drawString("DND LSA 6 X 8 ENGINE CAT C27",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 677.5, 0, 0));
  firstPage.graphics.drawString("DND LSA 6 X 8 ENGINE CAT C32",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 687.5, 0, 0));
  firstPage.graphics.drawString("DND LSA 6 X 8 ENGINE CAT 3508",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(8, 697.5, 0, 0));
  double mlo = 75;
  double vmlo = 225;
  int day = 6;
  int night = 18;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(
          "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
          bounds: Rect.fromLTRB(212.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(215, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "Bar", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(242.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "M", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(272.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "3", PdfStandardFont(PdfFontFamily.helvetica, 3),
          bounds: Rect.fromLTRB(277.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "/H", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(280, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "Rpm", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(305, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
          bounds: Rect.fromLTRB(342.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(345, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "0", PdfStandardFont(PdfFontFamily.helvetica, 3),
          bounds: Rect.fromLTRB(377.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "C", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(380, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "Volt", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(402.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "Liter", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(435, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(192.5, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = 0;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "00:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "00:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:30" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:30" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 15;
  day = day + 1;
  night = night + 1;
  for (var element in shiftList) {
    if ((element.shiftTime == "$day:00" && ongoing.shift == "Pagi") ||
        (element.shiftTime == "$night:00" && ongoing.shift == "Malam")) {
      if (element.status == "Running Operasi") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(75, vmlo, 0, 0));
      }
      if (element.status == "B.Down Rusak") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(120, vmlo, 0, 0));
      }
      if (element.status == "Standby") {
        firstPage.graphics.drawString(
            "V", PdfStandardFont(PdfFontFamily.helvetica, 8),
            bounds: Rect.fromLTRB(165, vmlo, 0, 0));
      }
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(260, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
      firstPage.graphics.drawString(element.remarkKeterangan.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(455, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 42.5;
  for (var element in dndList) {
    if (element.title == 'DND LCC 100 ENGINE PERKIN 1006-6T') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LCC 150 ENGINE VOLVO TAD1343VE') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LCC 200 ENGINE VOLVO TAD1643VE') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LCC 200 ENGINE SCANIA DC16') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(
          "6bar 87psi", PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LCC 200 ENGINE CAT C27') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LSA 6 X 8 ENGINE CAT C27') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LSA 6 X 8 ENGINE CAT C32') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }
  vmlo = vmlo + 10;
  for (var element in dndList) {
    if (element.title == 'DND LSA 6 X 8 ENGINE CAT 3508') {
      firstPage.graphics.drawString(element.oilBearingTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(195, vmlo, 0, 0));
      firstPage.graphics.drawString(element.pressureDisch.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(225, vmlo, 0, 0));
      firstPage.graphics.drawString(element.flowRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(257.5, vmlo, 0, 0));
      firstPage.graphics.drawString(
          element.rpm.toString(), PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(290, vmlo, 0, 0));
      firstPage.graphics.drawString(element.coolTemp.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(325, vmlo, 0, 0));
      firstPage.graphics.drawString(element.oilTempPressure.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(355, vmlo, 0, 0));
      firstPage.graphics.drawString(element.batteryVolt.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(390, vmlo, 0, 0));
      firstPage.graphics.drawString(element.fuelRate.toString(),
          PdfStandardFont(PdfFontFamily.helvetica, 6),
          bounds: Rect.fromLTRB(420, vmlo, 0, 0));
    }
  }

  firstPage.graphics.drawString(
      "Created by", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(50, 710, 0, 0));
  firstPage.graphics.drawString("Maint.Staff/Sr.Maint.Staff/Site Leader",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(10, 750, 0, 0));
  firstPage.graphics.drawString(
      "Approved by", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(390, 710, 0, 0));
  firstPage.graphics.drawString(
      "Field Supervise", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(385, 750, 0, 0));
  firstPage.graphics.drawString(
      "TOTAL", PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(17.5, 602.5, 0, 0));
  firstPage.graphics.drawString("SHIFT",
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(10, 160, 0, 0));
  firstPage.graphics.drawString("Running",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(65, 157.5, 0, 0));
  firstPage.graphics.drawString("Operasi",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(66, 167.5, 0, 0));
  firstPage.graphics.drawString("B.Down",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(111, 157.5, 0, 0));
  firstPage.graphics.drawString("Rusak",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(113, 167.5, 0, 0));
  firstPage.graphics.drawString("Standby",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(155, 162.5, 0, 0));
  firstPage.graphics.drawString("*Mohon isi di kolom keterangan jika",
      PdfStandardFont(PdfFontFamily.helvetica, 7),
      bounds: Rect.fromLTRB(67.5, 195, 0, 0));
  firstPage.graphics.drawString("berstatus Standby dan Breakdown",
      PdfStandardFont(PdfFontFamily.helvetica, 7),
      bounds: Rect.fromLTRB(70, 205, 0, 0));
  firstPage.graphics.drawString("Remarks",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(465, 170, 0, 0));
  firstPage.graphics.drawString("Keterangan",
      PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold),
      bounds: Rect.fromLTRB(460, 185, 0, 0));
  firstPage.graphics.drawString(
      "*Di isi maksimal setiap 2 jam terhitung dari jam mulai",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(240, 602.5, 0, 0));
  firstPage.graphics.drawString("DND VALUE MONITORING MAXIMAL OPERATING",
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: Rect.fromLTRB(170, 617.5, 0, 0));
  firstPage.graphics.drawString(
      "*Scania using oil", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(455, 650, 0, 0));
  firstPage.graphics.drawString(
      "engine pressure", PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: Rect.fromLTRB(455, 660, 0, 0));
  int dayTime = 5;
  int nightTime = 17;
  double dayTimeStart = 195;
  double nightTimeStart = 195;
  for (var i = 0; i < 12; i++) {
    dayTime = dayTime + 1;
    dayTimeStart = dayTimeStart + 30;
    firstPage.graphics.drawString(
        "$dayTime:00", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(5, dayTimeStart, 0, 0));
    firstPage.graphics.drawString(
        "$dayTime:30", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(5, dayTimeStart + 15, 0, 0));
    if (i == 11) {
      firstPage.graphics.drawString(
          "${dayTime + 1}:00", PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(5, dayTimeStart + 30, 0, 0));
    }
  }
  for (var i = 0; i < 12; i++) {
    if (i == 6) {
      nightTime = 0;
    } else {
      nightTime = nightTime + 1;
    }

    nightTimeStart = nightTimeStart + 30;
    firstPage.graphics.drawString(
        "$nightTime:00", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(35, nightTimeStart, 0, 0));
    firstPage.graphics.drawString(
        "$nightTime:30", PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: Rect.fromLTRB(35, nightTimeStart + 15, 0, 0));
    if (i == 11) {
      firstPage.graphics.drawString(
          "${nightTime + 1}:00", PdfStandardFont(PdfFontFamily.helvetica, 8),
          bounds: Rect.fromLTRB(35, nightTimeStart + 30, 0, 0));
    }
  }

  List<int> bytes = await document.save();

  document.dispose();

  saveAndLaunchFile((path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(
          path: path,
          document: document,
          bytes: bytes,
          profile: profile,
        ),
      ),
    );
  }, bytes, 'Output.pdf');
}
