import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controllerr;
  final TextInputType type;
  final VoidCallback? suffixpresed;
  final ValueChanged<String>? change;
  final ValueChanged? submit;
  final FormFieldValidator<String>? valid;
  final InputBorder? border;
  final bool ispassword;
  final bool readonly;
  final bool? enabled;
  final String? prefixtext;
  final double? max;
  final double? vertical;
  final Widget? prefixwidget;
  final String?hint;
  final BorderSide? border1;
  final IconData? suffix;
  final IconData? prefix;
  final String label;
  final Color? color1;
  final Color? color2;
  final double radius;
  final double? bradius;
  final FontWeight? fontweight;
  final double? fonts;
  final TextStyle? style;

  const DefaultTextFormField({
    Key? key,
    required this.controllerr,
    required this.type,
    this.suffixpresed,
    this.prefixtext,
    this.change,
    this.submit,
    this.valid,
    this.border,
    this.border1,
    this.suffix,
    this.prefix,
    required this.label,
    this.color1,
    this.color2,
    required this.radius,
    this.bradius,
    required this.fontweight,
    required this.fonts,
    this.style,
    required this.readonly,
    this.max,
    this.vertical,
    this.hint,
    required this.ispassword,
    this.prefixwidget,  this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerr,
      keyboardType: type,
      onChanged: change,
      onFieldSubmitted: submit,
      obscureText: ispassword,
      validator: valid,
      readOnly: readonly,
        cursorColor: Colors.black,
      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          isDense: true,
          enabled: enabled??true,
          prefixStyle: TextStyle(
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal:0,vertical: 0),
          prefixIconConstraints:BoxConstraints(minWidth: 0,maxWidth: max??double.infinity),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bradius??0),
          ),
          prefixIcon: Icon(prefix),
          prefix: prefixwidget,
          suffixIcon:Icon(suffix,size: 35,),
            label: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: fonts,
              fontWeight: fontweight,
            ),
          ),
      ),
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
