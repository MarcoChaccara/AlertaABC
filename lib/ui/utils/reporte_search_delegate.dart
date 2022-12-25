import 'package:alerta_abc/models/reporte_model.dart';
import 'package:alerta_abc/ui/widgets/item_reporte_widget.dart';
import 'package:flutter/material.dart';

class ReporteSearchDelegate extends SearchDelegate {
  List<ReporteModel> reportes;

  ReporteSearchDelegate({required this.reportes});

  List<String> names = [
    "Juan",
    "Luis",
    "Carlos",
    "Diana",
    "Susana",
    "María",
    "Alejandra",
    "Mariela",
    "Angela",
  ];

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar caso...";

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(
    fontSize: 18.0,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          "",
        );
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ReporteModel> results = reportes
        .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemReporteWidget(
            reporteModel: results[index],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ReporteModel> results = reportes
        .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemReporteWidget(
            reporteModel: results[index],
          );
        },
      ),
    );
  }
}
