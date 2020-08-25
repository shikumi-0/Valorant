import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Email and password sign up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    // update username

    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = username;
    await currentUser.user.updateProfile(userUpdateInfo);
    await currentUser.user.reload();
    return currentUser.user.uid;
  }

  // sign in
  Future<String> signInWithEmailAndPassword(
      String email, String password, String username) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  // sign out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
