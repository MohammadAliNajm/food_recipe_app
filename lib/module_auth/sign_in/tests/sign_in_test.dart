// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mockito/mockito.dart'; // Import the mockito package for mocking dependencies.


// import '../../../core/utils/helpers/custom_flushbar.dart';
// import '../repository/sign_in_repo.dart';
// import '../ui/screens/sign_in_screen.dart';

// class MockSignInScreenState extends Mock implements SignInScreenState {}

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// void main() {
//   group('SignInRepo Test', () {
//     test('Test SignIn Success', () async {
//       // Create a mock SignInScreenState instance.
//       final state = MockSignInScreenState();

//       // Create a mock FirebaseAuth instance.
//       final auth = MockFirebaseAuth();

//       // Create a mock email and password.
//       const email = 'test@example.com';
//       const password = 'password';

//       // Create a mock user.
//       final user = MockUser();

//       // Stub the signInWithEmailAndPassword method to return the mock user.
//       when(auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       )).thenAnswer((_) => Future.value(user));

//       // Create an instance of the SignInRepo class with the mock state and auth.
//       final repo = SignInRepo(state,);

//       // Call the SignIn method.
//        repo.SignIn(email, password);

//       // Verify that the loading stream emitted a waiting state.
//       expect(repo.loadingStream, emitsInOrder([AsyncSnapshot.waiting()]));

//       // Verify that the signInWithEmailAndPassword method was called once.
//       verify(auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       )).called(1);
//     });

//     test('Test SignIn Failure', () async {
//       // Create a mock SignInScreenState instance.
//       final state = MockSignInScreenState();

//       // Create a mock FirebaseAuth instance.
//       final auth = MockFirebaseAuth();

//       // Create a mock email and password.
//       const email = 'test@example.com';
//       const password = 'password';

//       // Create a mock exception.
//       final exception = FirebaseAuthException(
//         code: 'error',
//         message: 'Error message',
//       );

//       // Stub the signInWithEmailAndPassword method to throw the mock exception.
//       when(auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       )).thenThrow(exception);

//       // Create an instance of the SignInRepo class with the mock state and auth.
//       final repo = SignInRepo(state,);

//       // Call the SignIn method.
//       repo.SignIn(email, password);

//       // Verify that the loading stream emitted a waiting state.
//       expect(repo.loadingStream, emitsInOrder([AsyncSnapshot.waiting()]));

//       // Verify that the CustomFlushBarHelper.createError method was called once with the exception message.
//       verify(CustomFlushBarHelper.createError(
//               title: 'Error', message: exception.message.toString()))
//           .called(1);

//       // Verify that the signInWithEmailAndPassword method was called once.
//       verify(auth.signInWithEmailAndPassword(
//     email: email,
//     password: password,
//   )).called(1);
// });
// });
// }
