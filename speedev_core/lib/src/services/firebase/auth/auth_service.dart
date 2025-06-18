import 'package:firebase_auth/firebase_auth.dart';
import 'package:speedev_core/src/models/result_model.dart';

abstract class SDFirebaseAuthService {
  Future<SDResult<User>> signUpWithEmailAndPassword(String email, String password);

  Future<SDResult<User?>> signInWithEmailAndPassword(String email, String password);

  Future<SDResult<bool>> signOut();

  Future<SDResult<bool>> sendPasswordResetEmail(String email);

  Future<SDResult<bool>> sendEmailVerification();
}

class SDFirebaseAuthServiceImpl implements SDFirebaseAuthService {
  @override
  Future<SDResult<User>> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return SDResult(data: result.user, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return SDResult(errorCode: e.code, isSuccess: false);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<User?>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return SDResult(data: result.user, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return SDResult(errorCode: e.code, isSuccess: false);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return SDResult(data: true, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return SDResult(errorCode: e.code, isSuccess: false);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return SDResult(data: true, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return SDResult(errorCode: e.code, isSuccess: false);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        return SDResult(data: true, isSuccess: true);
      }
      return SDResult(errorMessage: "User not found", isSuccess: false);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }
}
