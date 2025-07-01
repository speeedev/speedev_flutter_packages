import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SDFirebaseFirestoreServiceAbstract {
  FirebaseFirestore get firestore;

  Future<void> addDocument({required String collectionName, String? documentId, required Map<String, dynamic> data});

  Future<void> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data});

  Future<void> deleteDocument({required String collectionName, required String documentId});

  Future<Map<String, dynamic>> getDocument({required String collectionName, required String documentId});

  Future<List<Map<String, dynamic>>> getDocuments({required String collectionName});
}

class SDFirebaseFirestoreService implements SDFirebaseFirestoreServiceAbstract {
  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> addDocument({required String collectionName, String? documentId, required Map<String, dynamic> data}) async {
    if (documentId != null) {
      await firestore.collection(collectionName).doc(documentId).set(data);
    } else {
      await firestore.collection(collectionName).add(data);
    }
  }

  @override
  Future<void> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data}) async {
    await firestore.collection(collectionName).doc(documentId).update(data);
  }

  @override
  Future<void> deleteDocument({required String collectionName, required String documentId}) async {
    await firestore.collection(collectionName).doc(documentId).delete();
  }

  @override
  Future<Map<String, dynamic>> getDocument({required String collectionName, required String documentId}) async {
    return await firestore.collection(collectionName).doc(documentId).get().then((value) => value.data() as Map<String, dynamic>);
  }

  @override
  Future<List<Map<String, dynamic>>> getDocuments({required String collectionName}) async {
    return await firestore.collection(collectionName).get().then((value) => value.docs.map((e) => e.data()).toList());
  }
}
