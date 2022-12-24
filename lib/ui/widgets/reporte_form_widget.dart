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

  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String categorySelected = "Localizado(a)";


  //Para la fecha
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
    if(datetime != null){
      _dateController.text = datetime.toString().substring(0, 10);
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
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
              controller: _nameController,
            ),
            divider10(),
            TextFieldNormalWidget(
              hintText: "Descripción",
              icon: Icons.description,
              controller: _descriptionController,
            ),
            divider10(),
            const Text("Categoría: "),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10.0,
              children: [
                FilterChip(
                  selected: categorySelected == "Localizado(a)",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelected],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Localizado(a)" ? Colors.white : kBrandPrimaryColor,
                  ),
                  label: Text("Localizado(a)"),
                  onSelected: (bool value) {
                    categorySelected = "Localizado(a)";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Desaparecido(a)",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelected],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Desaparecido(a)" ? Colors.white : kBrandPrimaryColor,
                  ),
                  label: Text("Desaparecido(a)"),
                  onSelected: (bool value) {
                    categorySelected = "Desaparecido(a)";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Archivado(a)",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelected],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: categorySelected == "Archivado(a)" ? Colors.white : kBrandPrimaryColor,
                  ),
                  label: Text("Archivado(a)"),
                  onSelected: (bool value) {
                    categorySelected = "Archivado(a)";
                    setState(() {});
                  },
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
              controller: _dateController,
            ),
            divider20(),
            ButtonNormalWidget(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
