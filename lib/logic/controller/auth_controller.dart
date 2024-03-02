import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';


class AuthController extends GetxController{
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;

  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    // displayUserPhoto.value =
    //     (userProfile != null ? userProfile!.photoURL : "")!;
    displayUserEmail.value =
        (userProfile != null ? userProfile!.email : "")!;
    super.onInit();
  }

  void visibility(){
    isVisibility = !isVisibility;

    update();
  }
  void checkBox(){
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase(String name, String email, String password) async {
    try {
       await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        displayUserName.value = name;
        auth.currentUser?.updateDisplayName(name);
       });
       update();
       Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('The password provided is too weak.','',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('The account already exists for that email.', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(e.toString(),'',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase(String email, String password) async {
    try {
       await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
         auth.currentUser?.displayName;
       });

       isSignedIn = true;
       authBox.write("auth", isSignedIn);
       update();
       Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar("Wrong Email & Password",'Try Sign Up',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpUsingFirebase() async {
    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch(e){
      Get.snackbar(e.toString(),'',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPasswordUsingFirebase(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('No user found for that email.','',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    }

  }

  void signOutUsingFirebase() async {
    try{
      await auth.signOut();
      await _googleSignIn.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';

      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed(Routes.welcomeScreen);
    }catch(e){
      Get.snackbar('Error.', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}