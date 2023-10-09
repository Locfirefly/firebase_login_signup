import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/repository/user.dart';

abstract class UserRepository{
  Stream<User?> get user;
  Future<void> login (String email, String password);
  Future<void> logOut ();
  Future<MyUser> signUp (MyUser myUser, String password);
  Future<void> resetPassword (String email);
  Future<void> setUserData (MyUser user);
  Future<void> getUserData (String userId);
}