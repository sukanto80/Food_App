import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../pages/Homepage.dart';
import '../../../pages/Splashscreen.dart';
import '../exceptions/signup_email_password_failer.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance ;
  late final Rx<User?> firebaseUser ;
  var verification = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser,_setInitialScreen);
  }
  _setInitialScreen (User? user){
    user == null ? Get.offAll(() =>  Splashscreen()) : Get.offAll(() =>  Homepage());
  }
  Future <void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value!= null ? Get.offAll(()=>  Homepage()) : Get.to(()=>   Splashscreen() ) ;
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION- ${ex.message}');
      throw ex ;

    } catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION- ${ex.message}');
      throw ex ;


    }
  }
  Future <void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){

    } catch(_){}
  }


  Future<void> logout() async => await _auth.signOut();



 }