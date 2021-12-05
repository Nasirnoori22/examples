import 'package:example/mixins/mixin_form_validation.dart';
import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({ Key? key }) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> with ValidatioinMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
          children: [
            emailField(), 
            passwordField(),
            SizedBox(
              height: 20,
            ),
            submitButton()
          ],
        )),
      ),
    );
  }
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (value){
        if(value == null || value.isEmpty){
          return 'field required';
        }
        if(!value.contains('@')){
          return 'Please enter valide email';
        }
      },
      onSaved: (value){
        email = value!;
      }
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
      ),

      validator: (value){
        if(value == null || value.isEmpty){
          return 'field required';
        }
        if(value.length < 5){
          return 'please enter strong password';
        }
        if(value.contains('&, *, #, !')){
          return 'dont special characters';
        }
      },
      onSaved: (value){
        password = value!;
      }
    );
  }
  
  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed:(){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          print('add to API');
        }
      },
    );
  } 
}