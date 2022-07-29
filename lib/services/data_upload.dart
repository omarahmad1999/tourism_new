import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourism_new/landmark_database.dart';
class Data {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void loadData() {
    for (var x in getInformation.keys) {
      firestore
          .collection('landmark_information')
          .add({'landmark_name': x, 'landmark_data': getInformation[x]});
    }
  }}