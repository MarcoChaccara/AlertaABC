
import 'package:alerta_abc/models/text_model.dart';
import 'package:alerta_abc/ui/general/colors.dart';
import 'package:alerta_abc/ui/widgets/general_widgets.dart';
import 'package:alerta_abc/ui/widgets/item_category_widget.dart';
import 'package:flutter/material.dart';

class ItemReporteWidget extends StatelessWidget {
  
  ReporteModel reporteModel;

  ItemReporteWidget({required this.reporteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(4, 4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCategoryWidget(
            text: reporteModel.category,
          ),  
          divider3(),
          Text(
            reporteModel.name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: kBrandPrimaryColor.withOpacity(0.85),
            ),
          ),
          Text(
            reporteModel.description,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: kBrandPrimaryColor.withOpacity(0.75),
            ),
          ),
          divider6(),
          Text(
            reporteModel.date,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: kBrandPrimaryColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}