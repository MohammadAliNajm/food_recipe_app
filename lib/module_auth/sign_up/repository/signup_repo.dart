import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe_app/core/utils/helpers/custom_flushbar.dart';
import 'package:food_recipe_app/module_auth/sign_up/ui/screens/sign_up_screen.dart';

class SignupRepo {
  final SignUpScreenState state;

  SignupRepo(this.state);
  Future signUp(String email, String password, num age, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //     .then((value) async {
      //   final user = FirebaseFirestore.instance
      //       .collection('users')
      //       .doc();
      //   final json = {
      //     'id':user.id,
      //     'Age': age,
      //     'Name': name
      //     };
      //   await user.set(json);
      // });
    } on FirebaseAuthException catch (e) {
      CustomFlushBarHelper.createError(
              title: 'Error', message: e.message.toString())
          .show(state.context);
    }
  }
}
