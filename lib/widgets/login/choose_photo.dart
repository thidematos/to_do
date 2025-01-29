import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/themes/color_theme.dart';

class ChoosePhoto extends StatefulWidget {
  const ChoosePhoto(this.onSelectImage, {super.key});

  final Function(File image) onSelectImage;

  @override
  State<ChoosePhoto> createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {
  File? pickedImage;

  void chooseImage() async {
    final rawImage = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 100, maxWidth: 250);

    if (rawImage == null) {
      return;
    }

    final file = File(rawImage.path);
    widget.onSelectImage(file);

    setState(() {
      pickedImage = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: ColorTheme.grey,
          foregroundImage: pickedImage != null ? FileImage(pickedImage!) : null,
        ),
        TextButton.icon(
          onPressed: chooseImage,
          label: Text('Escolha uma foto'),
          icon: Icon(Icons.camera),
        )
      ],
    );
  }
}
