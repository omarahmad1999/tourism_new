import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:tourism_new/services/fetch_landmark_data_service.dart';
import 'package:tourism_new/widgets/image_card_widget.dart';
var landmarkData;

class LandmarkInformationScreen extends StatelessWidget {
  String predictedLabel;
  static const String id = 'landmark_information_screen';

  LandmarkInformationScreen({required this.predictedLabel});
  



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<List<Widget>> createInfoCards() async {
      List<Widget> containers = [];
      var landmarkData = await getLandmarkData(predictedLabel);
      for (var dataPiece in landmarkData) {
        containers.add(buildImageCard(dataPiece,size));
      }
      return containers;
    }

    
    return Scaffold(
      backgroundColor: kScaffoldColour,
      appBar: AppBar(
        title: const Text('Landmark Information'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
              future: createInfoCards(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data![index];
                  },
                  itemHeight: size.height*(2.6/4),
                  itemWidth: size.width,
                  itemCount: snapshot.data!.length,
                  layout: SwiperLayout.TINDER,
                  pagination:
                  const SwiperPagination(alignment: Alignment.bottomCenter),
                )
                    : const Center(
                  child: CircularProgressIndicator(),
                );
              })
        ],
      ),
    );
  }
}




