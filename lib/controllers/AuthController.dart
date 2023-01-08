import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/usermodel.dart';
import 'package:untitled/views/screens/auth/login_screen.dart';

import '../views/screens/homescreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _profilephoto;
  Rx<String> _path = Rx<String>("");
  File? get profilephoto => _profilephoto.value;
  String get path => _path.value;
  late Rx<User?> _user;

  void pickImage() async {
    final pickedIMage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedIMage != null) {
      _profilephoto = Rx<File?>(File(pickedIMage.path));
      _path = Rx<String>(profilephoto!.path);
      Get.snackbar("Profile pic", path);
    }
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  void logout() async {
    await firebaseAuth.signOut();
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar("Login", "success");
      } else {
        Get.snackbar("error", "wrong fields");
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  void register(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadurl = await _uploadImage(image);
        UserModel user = UserModel(
            name: username,
            email: email,
            pic: downloadurl,
            uid: cred.user!.uid);

        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        Get.snackbar("SIGNUP", "SUCCESS");
      } else {
        Get.snackbar(
            "please enter all the fields", "please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error creating an account", e.toString());
    }
  }

  Future<String> _uploadImage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask task = ref.putFile(image);
    TaskSnapshot snap = await task;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}
