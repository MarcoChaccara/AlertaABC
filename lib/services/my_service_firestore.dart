
import 'package:alerta_abc/models/reporte_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Esta clase nos permitirá conectarnos con FireStore
class MyServiceFirestore{

  String collection;
  MyServiceFirestore({required this.collection});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  //add

  //Cuando agregue una tarea me devolverá el id
  Future<String> addReporte(ReporteModel model) async{
    DocumentReference documentReference = await _collectionReference.add(model.toJson());
    String id = documentReference.id;
    return id;
  }

  //delete
  // deleteReporte(){
  //   _collectionReference.delete({});
  // }


  //update


}