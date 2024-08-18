import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ingredient_cooker/features/presentation/widgets/buttons_for_profile_image.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

class Profile_Image extends StatefulWidget {
  const Profile_Image({super.key});

  @override
  State<Profile_Image> createState() => _Profile_ImageState();
}

class _Profile_ImageState extends State<Profile_Image> {
  // file
  File? imagefile;

  final picker = ImagePicker();
  _imgfromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 100)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgfromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 100)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

// crop image
  _cropImage(File imgfile) async {
    final croppedfile = await ImageCropper().cropImage(
        sourcePath: imgfile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio7x5
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Crop image",
            toolbarColor: Colors.blue,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            toolbarWidgetColor: Colors.white));
    if (croppedfile != null) {
      imageCache.clear();
      setState(() {
        imagefile = File(croppedfile.path);
      });
    }
  }

  // bottom sheet
  Future _displaybottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Profile Photo",
              style: TextStyle(
                  fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    Map<Permission, PermissionStatus> status =
                        await [Permission.camera, Permission.storage].request();
                    if (status[Permission.camera]!.isGranted &&
                        status[Permission.storage]!.isGranted) {
                      _imgfromCamera();
                    } else {
                      _imgfromCamera();

                      print("Permission Denied!");
                    }
                  },
                  child: Buttons_Image(
                    icon: Clarity.camera_solid,
                    title: 'Camera',
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Map<Permission, PermissionStatus> status = await [
                      Permission.storage,
                      Permission.storage
                    ].request();
                    if (status[Permission.storage]!.isGranted &&
                        status[Permission.storage]!.isGranted) {
                      _imgfromGallery();
                    } else {
                      _imgfromGallery();
                      print("Permission Denied!");
                    }
                  },
                  child: Buttons_Image(
                      icon: Clarity.picture_outline_badged, title: 'Gallery'),
                ),
                Buttons_Image(icon: Clarity.trash_solid, title: 'Delete')
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                _displaybottomSheet(context);
              },
              icon: Icon(
                Icons.edit_rounded,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_rounded,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            HeroIcons.arrow_left,
            color: Colors.white,
          ),
        ),
        title: Text('Profile Photo'),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Center(
        child: SizedBox.square(
          child: Hero(
              tag: 'edit',
              child: imagefile == null
                  ? Image.asset("assets/images/me.jpg")
                  : ClipRRect(
                      child: Image.file(
                        imagefile!,
                        fit: BoxFit.fill,
                      ),
                    )),
        ),
      ),
    );
  }
}
