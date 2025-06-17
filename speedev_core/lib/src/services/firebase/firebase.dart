import 'package:firebase_core/firebase_core.dart';

class SDFirebaseService {
  static final SDFirebaseService _instance = SDFirebaseService._();

  SDFirebaseService._();

  factory SDFirebaseService() => _instance;

  bool _isInitialized = false;

  Future<void> init({
    required FirebaseOptions options,
  }) async {
    if (_isInitialized) {
      return;
    }

    try {
      await Firebase.initializeApp(
        options: options,
      );
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize Firebase: $e');
    }
  }

  bool get isInitialized => _isInitialized;
}
