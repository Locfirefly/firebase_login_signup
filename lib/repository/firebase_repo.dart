import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_signup/repository/model/project.dart';
import 'package:firebase_login_signup/repository/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/repository/entity/user_entity.dart';
import 'package:firebase_login_signup/repository/repo.dart';

class FirebaseUserRepository implements UserRepository{

  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  final projectCollection = FirebaseFirestore.instance.collection('projects');

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<void> login(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    }
    catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email,
          password: password
      );

      myUser = myUser.copyWith(
        id: userCredential.user!.uid,
        name: userCredential.user!.displayName
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try{
      await _firebaseAuth.signOut();
    }
    catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch (e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try{
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    }
    catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getUserData(String userId) async {
    try{
      return usersCollection.doc(userId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!))
      );
    }
    catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Project> addProject(Project project) async {
    try{
      await projectCollection.doc().set(project.toEntity().toDocument());
      return project;
    }
    catch (e){
      log(e.toString());
      rethrow;
        }
  }

  @override
  Future<List<Project>> getProject() {

    throw UnimplementedError();
  }

}