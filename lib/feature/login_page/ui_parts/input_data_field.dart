import 'package:flutter/material.dart';
import 'package:piller_test/feature/login_page/ui_parts/obscure_icon.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class InputDataField extends StatefulWidget {
  final String?               initData;
  final String                label;
  final ValueChanged<String?> onChange;
  final Icon                  leadIcon;
  final String?               errorText;
  final bool                  obscureTextNeeded;
  
  const InputDataField({
    super.key, 
    required this.label, 
    required this.onChange, 
    required this.leadIcon, 
    required this.errorText,
    required this.initData, 
    this.obscureTextNeeded = false,
  });

  @override
  State<InputDataField> createState() => _InputDataFieldState();
}

class _InputDataFieldState extends State<InputDataField> {

  bool obscureTextActive = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initData,
      obscureText: (obscureTextActive && widget.obscureTextNeeded),
      onChanged:   (text) => widget.onChange(text),
      decoration:  InputDecoration(
        errorText:     widget.errorText,
        prefixIcon:    widget.leadIcon,
        labelText:     widget.label,
        border:        const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder( borderSide: baseBorderSideStyleOnDataField ),
        focusedBorder: const OutlineInputBorder( borderSide: focusedBorderSideStyleOnDataField ),
        suffixIcon:    ObscureIcon(
          obscureTextEnabled: widget.obscureTextNeeded,
          obscureTextActive:  obscureTextActive,
          onTap:              () => setState(() { obscureTextActive = !obscureTextActive;}),
        ),
      ),
    );
  }
}
