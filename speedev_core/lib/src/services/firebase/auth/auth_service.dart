import 'package:firebase_auth/firebase_auth.dart';
import 'package:speedev_core/src/models/result_model.dart';

abstract class SDFirebaseAuthServiceAbstract {
  Future<SDResult<User>> signUpWithEmailAndPassword({required String email, required String password});

  Future<SDResult<User>> signInWithEmailAndPassword({required String email, required String password});

  Future<SDResult<bool>> signOut();

  Future<SDResult<bool>> sendPasswordResetEmail({required String email});

  Future<SDResult<bool>> sendEmailVerification();

  Future<SDResult<User>> getCurrentUser();

  Future<SDResult<String>> getCurrentUserUid();

  Future<SDResult<String>> getCurrentUserEmail();

  Future<SDResult<bool>> isEmailVerified();

  Future<SDResult<String?>> getCurrentUserToken();

  Future<SDResult<bool>> isUserSignedIn();
}

class SDFirebaseAuthService implements SDFirebaseAuthServiceAbstract {
  @override
  Future<SDResult<User>> signUpWithEmailAndPassword({required String email, required String password}) async {
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
  Future<SDResult<User>> signInWithEmailAndPassword({required String email, required String password}) async {
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
  Future<SDResult<bool>> sendPasswordResetEmail({required String email}) async {
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

  @override
  Future<SDResult<User>> getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return SDResult(data: user, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<String>> getCurrentUserUid() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return SDResult(data: user?.uid ?? "", isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<String>> getCurrentUserEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return SDResult(data: user?.email ?? "", isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> isEmailVerified() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return SDResult(data: user?.emailVerified ?? false, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<String?>> getCurrentUserToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final token = await user?.getIdToken();
      return SDResult(data: token, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> isUserSignedIn() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return SDResult(data: user != null, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }
}
