import 'package:flutter/material.dart';

class MotivoInputTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final bool obsecure;

  const MotivoInputTextField(
      {Key key,
      this.icon,
      this.hint,
      this.textInputType,
      this.textEditingController,
      this.obsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obsecure,
        controller: this.textEditingController,
        autofocus: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            hintText: hint,
            contentPadding: EdgeInsets.fromLTRB(20, 13, 20, 13),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                )),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: Icon(icon, size: 14,),
              ),
            )),
      ),
    );
  }
}
