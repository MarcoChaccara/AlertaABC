import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  CollectionReference reportesReference = FirebaseFirestore.instance.collection('Reportes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                reportesReference.get().then((value){
                  QuerySnapshot collection = value;
                  List<QueryDocumentSnapshot> docs = collection.docs;
                  print(docs);
                });
              },
              child: Text(
                "Obtener la data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
