import 'dart:io';
import 'package:image_picker/image_picker.dart';
final _picker = ImagePicker();
File? _image;

getImageFromGallery() async {
  var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    _image = File(pickedFile.path);
    return _image;
  }
   else {
    return null;
  }

}



getImageFromCamera() async {
  var pickedFile = await _picker.pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    _image = File(pickedFile.path);
    return _image;
  } else {
    return null;
  }

}