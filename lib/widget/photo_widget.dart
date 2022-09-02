import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/models/custom_image.dart';
import 'package:log_paper/style/colors.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({Key? key, this.imageFile, this.onTap, this.onHoldTap})
      : super(key: key);
  final CustomImage? imageFile;
  final Function()? onTap;
  final Function(CustomImage)? onHoldTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imageFile == null) {
          onTap!();
        }
      },
      onLongPress: () {
        if (imageFile != null) {
          onHoldTap!(imageFile!);
        }
      },
      child: imageFile == null
          ? Container(
              decoration: BoxDecoration(color: darkTeal()),
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.camera_enhance,
                color: Colors.white,
                size: 80,
              ))
          : Image.file(
              File(imageFile!.customImage!),
              fit: BoxFit.cover,
            ),
    );
  }
}
