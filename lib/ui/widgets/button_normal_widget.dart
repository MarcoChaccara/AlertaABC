
import 'package:alerta_abc/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ButtonNormalWidget extends StatelessWidget {
  
  Function onPressed;

  ButtonNormalWidget({required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  double.infinity,
      height: 52.0,
      child: ElevatedButton.icon(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: kBrandPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        icon: Icon(Icons.save),
        label: Text(
          "Guardar",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}