import 'dart:ui';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Color darkBlue() {
  return fromHex("24877B");
}

Color lightBlue() {
  return fromHex("6EE1DA");
}

Color white() {
  return fromHex("FFFFFF");
}

Color black() {
  return fromHex("000000");
}

Color grey() {
  return fromHex("B9B9B9");
}

Color darkGrey() {
  return fromHex("426572");
}

Color darkTeal() {
  return fromHex("1E9FA7");
}

Color skyBlue() {
  return fromHex("58C5E8");
}
