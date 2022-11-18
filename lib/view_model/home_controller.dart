import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController {
  Future<List?> getDatasFromFirebase() async {
    List notes = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot<Object?> querySnapshot =
          await firestore.collection('notes').get();
      log(querySnapshot.toString());
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map<String, dynamic> items = {
            'notes': doc.id,
            'desc': doc['desc'],
            'title': doc['title']
          };
          log(doc.id.toString());
          notes.add(items);
          log(notes.length.toString());
          return notes;
        }
      } else {
        log('not datas');
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  addDatatoFirebase() {}
}
