import 'package:flutter/material.dart';

class ImagePickerDialog extends StatelessWidget {
  final void Function()? cameraOnTap;
  final void Function()? galleryOnTap;

  const ImagePickerDialog({Key? key, this.cameraOnTap, this.galleryOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Wrap(children: <Widget>[
        ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            title: const Text('Camera',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: cameraOnTap),
        ListTile(
            leading: const Icon(
              Icons.photo_outlined,
              color: Colors.white,
            ),
            title: const Text('Gallery',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: galleryOnTap),
      ]),
    );
  }
}