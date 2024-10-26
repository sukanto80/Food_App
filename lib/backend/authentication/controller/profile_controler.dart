
import 'package:get/get.dart';
import 'package:home_kitchen/backend/repository/authentication_repository/authentication_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{
  static  ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());



/// step 3 - Get User Email and pass to UserRepository to fetch user record
   getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email!= null){
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue") ;
    }

  }



}