import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


var landmarkData;
Future<List> getLandmarkData(String predictedLabel) async {
  try {
    var information = await _firestore
        .collection('landmark_information')
        .where('landmark_name', isEqualTo: predictedLabel)
        .get();
    for (var landmark in information.docs) {
      landmarkData = landmark.data()['landmark_data'];
    }
  } catch (e) {
    print(e);
  }finally{
    return landmarkData;
  }

}