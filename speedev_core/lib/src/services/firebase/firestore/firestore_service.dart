import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SDFirebaseFirestoreServiceAbstract {
  FirebaseFirestore get firestore;

  Future<void> addDocument(String collectionPath, Map<String, dynamic> data);

  Future<void> updateDocument(String collectionPath, String documentId, Map<String, dynamic> data);

  Future<void> deleteDocument(String collectionPath, String documentId);

  Future<Map<String, dynamic>> getDocument(String collectionPath, String documentId);

  Future<List<Map<String, dynamic>>> getDocuments(String collectionPath);
}

class SDFirebaseFirestoreService implements SDFirebaseFirestoreServiceAbstract {
  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) async {
    await firestore.collection(collectionPath).add(data);
  }

  @override
  Future<void> updateDocument(String collectionPath, String documentId, Map<String, dynamic> data) async {
    await firestore.collection(collectionPath).doc(documentId).update(data);
  }

  @override
  Future<void> deleteDocument(String collectionPath, String documentId) async {
    await firestore.collection(collectionPath).doc(documentId).delete();
  }

  @override
  Future<Map<String, dynamic>> getDocument(String collectionPath, String documentId) async {
    return await firestore.collection(collectionPath).doc(documentId).get().then((value) => value.data() as Map<String, dynamic>);
  }

  @override
  Future<List<Map<String, dynamic>>> getDocuments(String collectionPath) async {
    return await firestore.collection(collectionPath).get().then((value) => value.docs.map((e) => e.data()).toList());
  }
}
