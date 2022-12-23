import 'package:alerta_abc/models/text_model.dart';
import 'package:alerta_abc/ui/general/colors.dart';
import 'package:alerta_abc/ui/widgets/button_normal_widget.dart';
import 'package:alerta_abc/ui/widgets/general_widgets.dart';
import 'package:alerta_abc/ui/widgets/item_reporte_widget.dart';
import 'package:alerta_abc/ui/widgets/reporte_form_widget.dart';
import 'package:alerta_abc/ui/widgets/textfield_normal_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference reportesReference =
      FirebaseFirestore.instance.collection('Reportes');

  // Formulario para el botón "Agregar Caso"
  showReporteForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ReporteFormWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandSecondaryColor,
      floatingActionButton: InkWell(
        onTap: () {
          showReporteForm(context);
        },
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
          decoration: BoxDecoration(
            color: kBrandPrimaryColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Agregar caso",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido, Marco",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    Text(
                      "Lista de los casos",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    divider10(),
                    //Campo de búsqueda
                    TextFieldNormalWidget(
                      icon: Icons.search,
                      hintText: "Buscar caso...",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Todos los casos",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: kBrandPrimaryColor.withOpacity(0.85),
                    ),
                  ),
                  StreamBuilder(
                    stream: reportesReference.snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        List<ReporteModel> reportes = [];
                        QuerySnapshot collection = snap.data;

                        // collection.docs.forEach((element){
                        //   Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
                        //   reportes.add(ReporteModel.fromJson(myMap));
                        // });

                        reportes = collection.docs
                            .map((e) => ReporteModel.fromJson(
                                e.data() as Map<String, dynamic>))
                            .toList();

                        return ListView.builder(
                          itemCount: reportes.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemReporteWidget(
                              reporteModel: reportes[index],
                            );
                          },
                        );
                      }
                      return loadingWidget();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // body: StreamBuilder(
      //   stream: reportesReference.snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot snap){
      //     if(snap.hasData){
      //       QuerySnapshot collection = snap.data;
      //       List<QueryDocumentSnapshot> docs = collection.docs;
      //       List<Map<String, dynamic>> docsMap = docs.map((e) => e.data() as Map<String, dynamic>).toList();
      //       print(docsMap);
      //       return ListView.builder(
      //         itemCount: docsMap.length,
      //         itemBuilder:  (BuildContext context, int index){
      //           return ListTile(
      //             title: Text(docsMap[index]["name"]),
      //           );
      //         },
      //       );
      //     }
      //     return Center(child: CircularProgressIndicator(),);
      //   }
      // ),
    );
  }
}
