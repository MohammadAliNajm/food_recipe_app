import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/screens/sign_in_screen.dart';
import 'package:food_recipe_app/module_auth/sign_up/ui/screens/sign_up_screen.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  bool isSignIn = true;
  void toggle() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return isSignIn ? SignInScreen(toggle: toggle): SignUpScreen(toggle: toggle,);
  }
}
