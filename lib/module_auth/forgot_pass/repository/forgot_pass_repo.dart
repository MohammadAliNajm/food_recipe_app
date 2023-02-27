import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe_app/core/utils/helpers/custom_flushbar.dart';

class ForgotPassRepo {
  Future forgotPass(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      CustomFlushBarHelper.createError(
          title: 'title', message: e.message.toString());
    }
  }
}
