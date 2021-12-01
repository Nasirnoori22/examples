class ValidatioinMixin{

   String ValidateEmail (value){
        if(value == null || value.isEmpty){
          return 'field required';
        }
        if(!value.contains('@')){
          return 'Please enter valide email';
        }
        return '';
      }    
  String ValidatePassword (value){
        if(value == '' || value.isEmpty){
              print(value);

          return 'field required';
        }
        if(value.length < 5){
          return 'please enter strong password';
        }
        if(value.contains('&, *, #, !')){
          return 'dont special characters';
        }
        return '';
      }
}