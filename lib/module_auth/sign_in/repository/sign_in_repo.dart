import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/utils/helpers/custom_flushbar.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/screens/sign_in_screen.dart';
import 'package:rxdart/rxdart.dart';

class SignInRepo {
  final SignInScreenState state;

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;
  SignInRepo(this.state);
  void SignIn(String email, String password) async {
   
    try {
       _loadingStateSubject.add(AsyncSnapshot.waiting());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      CustomFlushBarHelper.createError(
              title: 'Error', message: e.message.toString())
          .show(state.context);
    }
  }
}
