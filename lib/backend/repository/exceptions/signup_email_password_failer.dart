 class SignUpWithEmailAndPasswordFailure{
  final String message ;

  const SignUpWithEmailAndPasswordFailure([this.message ="An Unknown error occurred"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak password' :
        return const SignUpWithEmailAndPasswordFailure ('please enter a strong password ');
      case 'invalid-email' :
        return const SignUpWithEmailAndPasswordFailure ('email is not valid or badly formated');
      case'email-already-in-use' :
        return const SignUpWithEmailAndPasswordFailure('An account is already exists for that email ');
      case 'opperation-not-allowed' :
        return const SignUpWithEmailAndPasswordFailure
          ('operation is not allowed please contract support ');
        default:
          return const SignUpWithEmailAndPasswordFailure();
    }
  }
 }