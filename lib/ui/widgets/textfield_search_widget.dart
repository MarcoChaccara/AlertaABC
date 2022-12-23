import 'package:alerta_abc/ui/general/colors.dart';
import 'package:flutter/material.dart';

class TextFieldSearchWidget extends StatelessWidget {
  const TextFieldSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.0,
                          color: kBrandPrimaryColor.withOpacity(0.6),
                        ),
                        hintText: "Buscar caso...",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: kBrandPrimaryColor.withOpacity(0.6),
                        ),
                        filled: true,
                        fillColor: kBrandSecondaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
  }
}