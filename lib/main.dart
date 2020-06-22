import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:form/model.dart';
import 'package:form/my_textform_field.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Text From Field'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text(widget.title),),
       body: MyFormField(),
     );
  }
}
class MyFormField extends StatefulWidget {
  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  final _formField = GlobalKey<FormState>();
  Model model = Model();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width/2;
    return Form(
         key: _formField,
         child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 Container(
                   alignment: Alignment.topCenter,
                   width: halfMediaWidth,
                   child: MyTextFormField(
                     hintText: 'First Name',
                     validator: (String v){
                       if (v.isEmpty) {
                         return 'Enter your first name';
                       }
                       return null;
                     },
                     onSaved: (String v) {
                       model.firstName = v;
                     },
                   )),
                 Container(
                     alignment: Alignment.topCenter,
                     width: halfMediaWidth,
                     child: MyTextFormField(
                       hintText: 'Last Name',
                       validator: (String v){
                         if (v.isEmpty) {
                           return 'Enter your last name';
                         }
                         return null;
                       },
                       onSaved: (String v) {
                         model.lastName = v;
                       },
                     )),
               ],
             ),
             Container(
                 alignment: Alignment.topCenter,
                 child: MyTextFormField(
                   hintText: 'Email',
                   validator: (String v){
                     if (!EmailValidator.validate(v)) {
                       return 'Please enter a valid email';
                     }
                     return null;
                   },
                   onSaved: (String v) {
                     model.firstName = v;
                   },
                   isEmail: true,
                 )),
             Container(
                 alignment: Alignment.topCenter,
                 child: MyTextFormField(
                   hintText: 'Password',
                   validator: (String v){
                     if (v.length < 7) {
                       return 'Password should be minimum 7 characters';
                     }
                     return null;
                   },
                   onSaved: (String v) {
                     model.password= v;
                   },
                   isPassword: true,
                 )),
             Container(
                 alignment: Alignment.topCenter,
                 child: MyTextFormField(
                   hintText: 'Confirm password',
                   validator: (String v){
                     if (v.length < 7) {
                       return 'Password should be minimum 7 characters';
                     }
                     return null;
                   },
                   onSaved: (String v) {
                     model.confirmPassword = v;
                   },
                   isPassword: true,
                 )),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                      if (_formField.currentState.validate()) {
                        _formField.currentState.save();
                      }
                      if (model.password != model.confirmPassword) {
                        Toast.show('Password not valid', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      }
                },  child: Text('Sing Up'),)
           ],
         ));
  }
}

