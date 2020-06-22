
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  const MyTextFormField({Key key, this.hintText, this.validator, this.onSaved, this.isPassword = false, this.isEmail = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(8),
       child: TextFormField(
         decoration: InputDecoration(
           hintText: hintText,
           labelText: hintText,
           contentPadding: EdgeInsets.all(15),
           border: InputBorder.none,
           filled: true,
           fillColor: Colors.grey[200]
         ),
         obscureText: isPassword ? true: false,
         validator: validator,
         onSaved: onSaved,
         keyboardType: isEmail ? TextInputType.emailAddress: TextInputType.text,
      ),

    );
  }
}
