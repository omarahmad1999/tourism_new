import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:tourism_new/services/fetch_landmark_data_service.dart';
var landmarkData;

class LandmarkInformationScreen extends StatelessWidget {
  String predictedLabel;
  static const String id = 'landmark_information_screen';

  LandmarkInformationScreen({required this.predictedLabel});

  Future<List<Widget>> createInfoCards() async {
    List<Widget> containers = [];
    int counter = 1;
    var landmarkData = await getLandmarkData(predictedLabel);
    for (var dataPiece in landmarkData) {
      containers.add(InfoCard(
          cardNumber: counter,
          colour: kInfoCardsColors[(counter - 1) % 3],
          info: dataPiece));
      counter += 1;
    }
    return containers;
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldColour,
      appBar: AppBar(
        title: const Text('Landmark Information'),
        backgroundColor: kAppBarColour,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: kLightCoralColour, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              predictedLabel.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
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
                  itemHeight: size.width,
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

class InfoCard extends StatelessWidget {
  final Color? colour;
  final String? info;
  final int? cardNumber;
  InfoCard(
      {Key? key, @required this.colour, @required this.info, @required this.cardNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
        BoxConstraints(minWidth: size.width, minHeight: size.width),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all( Radius.circular(15)),
            color: colour,
          ),
          child: Column(
            children: [
              Text(
                '$cardNumber',
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  info!,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
