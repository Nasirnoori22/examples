import 'package:flutter/material.dart';
import 'package:example/mixins/mixin_form_validation.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({ Key? key }) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> with ValidatioinMixin{
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
      validator: ValidateEmail,
      onSaved: ( value){
        value = email;
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

      validator: ValidatePassword,
      onSaved: (value){
        value = password;
      }
    );
  }
  
  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed:(){
         print(formKey.currentState!.validate().toString());
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
         
        }
      },
    );
  } 
}