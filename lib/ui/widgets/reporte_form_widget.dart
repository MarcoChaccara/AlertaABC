import 'package:alerta_abc/ui/general/colors.dart';
import 'package:alerta_abc/ui/widgets/button_normal_widget.dart';
import 'package:alerta_abc/ui/widgets/general_widgets.dart';
import 'package:alerta_abc/ui/widgets/textfield_normal_widget.dart';
import 'package:flutter/material.dart';

class ReporteFormWidget extends StatefulWidget {
  const ReporteFormWidget({super.key});

  @override
  State<ReporteFormWidget> createState() => _ReporteFormWidgetState();
}

class _ReporteFormWidgetState extends State<ReporteFormWidget> {
  showSelectDate() async {
    DateTime? datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      helpText: "Seleccionar fecha",
      builder: (BuildContext context, Widget? widget) {
        return Theme(
          //Tema del calendario (fecha)
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.white,
            dialogTheme: DialogTheme(
              elevation: 0,
              backgroundColor: kBrandSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: kBrandPrimaryColor,
            ),
          ),
          child: widget!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Agregar caso",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Nombre",
            icon: Icons.text_fields,
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Descripción",
            icon: Icons.description,
          ),
          divider10(),
          Text("Categoría: "),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            spacing: 10.0,
            children: [
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Localizado(a)"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Localizado(a)"),
                onSelected: (bool value) {},
              ),
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Desaparecido(a)"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Desaparecido(a)"),
                onSelected: (bool value) {},
              ),
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Archivado(a)"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Archivado(a)"),
                onSelected: (bool value) {},
              ),
            ],
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Fecha",
            icon: Icons.date_range,
            onTap: () {
              showSelectDate();
            },
          ),
          divider20(),
          ButtonNormalWidget(),
        ],
      ),
    );
  }
}
