import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _picker = ImagePicker();
  File? _image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor:Colors.black,),
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.2,
            child: Stack(
              children: [
                Container(

                  height: (size.height*0.2) -27,
                  decoration: const BoxDecoration(color: Colors.black,
                  borderRadius:  BorderRadius.only(
                    bottomLeft:  Radius.circular(36),
                    bottomRight: Radius.circular(36)
                  )
                  ),
                ),
      Positioned(
             right: 10,
        bottom: 50,
        child: Stack(
          children:[CircleAvatar(
            backgroundColor: Colors.white,
            radius: 52,

            child: ClipRRect(
              borderRadius:BorderRadius.circular(50),

              child: _image==null?Image.asset('assets/male_avatar.png'):Image.file(
                  _image!),
            ),
          ),
            IconButton(onPressed: ()async{
              var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              } else {

              }
            }, icon: const Icon(Icons.edit))
          ]
        ),),
                const Positioned
                  (left: 10,
                    bottom: 80,
                    child:  Text('Hi, Omar!',style:  TextStyle(color: Colors.white,fontSize: 30),))


              ],
            ),
          )
        ],
      ),
    );
  }
}
