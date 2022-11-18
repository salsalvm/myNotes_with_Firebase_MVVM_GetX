import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  List notes = [];
  Future getDatasFromFirebase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firestore.collection('notes').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map<String, dynamic> items = {
            'notes': doc.id,
            'title': doc['title'],
            'desc': doc['desc']
          };
          notes.add(items);
          return items;
        }
      }
    } catch (e) {
      // log(e.toString());
    }
    update();
  }

  addDatatoFirebase(String title, String desc) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('notes')
        .add({'desc': desc, 'title': title});
    getDatasFromFirebase();
    update();
  }

  updateDatatoFirebase(String id, String title, String desc) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('notes')
        .doc(id)
        .update({'title': title, 'desc': desc});
    // getDatasFromFirebase();
    update();
  }

  deleteDataFromFirebase(String id) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection('notes').doc(id).delete();
    // getDatasFromFirebase();
    update();
  }

  @override
  void onInit() {
    getDatasFromFirebase();
    super.onInit();
  }
}
