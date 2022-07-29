import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/services/detection_service.dart';
import 'package:tourism_new/widgets/rounded_button_widget.dart';
import 'landmark_information_screen.dart';
import 'package:tourism_new/widgets/error_message_widget.dart' as error;
import 'package:tourism_new/services/image_picker_service.dart';
class DetectionScreen extends StatefulWidget {
  static const String id = 'detection_screen';

  const DetectionScreen({Key? key}) : super(key: key);

  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {

  File? _image;
  List? _recognitions;
  bool _busy = false;
  String? _predictedLabel;
  @override
  void initState() {
    // var data =   Data();
    // data.loadData();

    _busy = true;
    super.initState();
    DetectionService.loadModel().then((value) {
      setState(() {
        _busy = false;
      });
    }).catchError((err) {
      error.errorMessage(context, 'Failed To Load Model');
      _busy = false;
    });
  }

  void updateUI(File image) async {
    _recognitions = await DetectionService.objectDetection(image);
    setState(() {
      _predictedLabel = DetectionService.predictedLabel(_recognitions!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];
    _image != null
        ? stackChildren.add(
      Container(

          width:size.width,
          height: size.height * (5 / 7),
          margin: const EdgeInsets.all(5),
          
          decoration: BoxDecoration(
            boxShadow:[const BoxShadow(
              offset: Offset(0,10),
              blurRadius: 60,
            )] ,
            image: DecorationImage(
              image:  FileImage(_image!),
                  fit: BoxFit.fill
            ),

            color: Colors.black,
             borderRadius: const BorderRadius.all(Radius.circular(5)),
            // border: Border.all(width: 5, color: Colors.black),
          ),

        ),
    )
        : stackChildren.add(Center(
      child: Container(
        child: const Text('Select an Image'),
      ),
    ));
    if (_image != null) {
      stackChildren.addAll(DetectionService.renderBoxes(size));
    }
    if (_busy) {
      stackChildren.add(
        const Center(
          child:  CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Landmark Detection'),
        backgroundColor: Colors.black,
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      backgroundColor: kScaffoldColour,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Stack(
                children: stackChildren,
              ),
            ),
            Expanded(
                flex: 4,
                child: (_predictedLabel != null&& _predictedLabel!='no_detection')
                    ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: kLightCoralColour, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        _predictedLabel!.toUpperCase().replaceAll(RegExp(r'_'),  ' '),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    _predictedLabel != 'Unknown Landmark'
                        ? RoundedButton(
                        colour: kDarkCoralColour,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LandmarkInformationScreen(
                                        predictedLabel:
                                        _predictedLabel!,
                                      )));
                        },
                        title: 'Historical Information')
                        : Container(),
                  ],
                )
                    : Column())
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: const Color(0xffB2EEE6),
            heroTag: 'floatButton1',
            onPressed: ()async{
              _image=await getImageFromGallery();
              if(_image!=null){
                updateUI(_image!);
              }

            },
            child: const Icon(
              Icons.photo,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xff8AD6CC),
            heroTag: 'floatButton2',
            onPressed: ()
                  async{
                _image=await getImageFromCamera();
                if(_image!=null){
                  updateUI(_image!);
                }
              },

            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }

}
