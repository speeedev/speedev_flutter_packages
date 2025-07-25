import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SDFirebaseFirestoreServiceAbstract {
  FirebaseFirestore get firestore;

  Future<DocumentReference> addDocument({required String collectionName, String? documentId, required Map<String, dynamic> data});

  Future<void> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data});

  Future<void> deleteDocument({required String collectionName, required String documentId});

  Future<Map<String, dynamic>> getDocument({required String collectionName, required String documentId});

  Future<List<Map<String, dynamic>>> getDocuments({
    required String collectionName,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>> collection)? queryBuilder,
  });
}

class SDFirebaseFirestoreService implements SDFirebaseFirestoreServiceAbstract {
  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<DocumentReference> addDocument({required String collectionName, String? documentId, required Map<String, dynamic> data}) async {
    if (documentId != null) {
      return firestore.collection(collectionName).doc(documentId);
    } else {
      return firestore.collection(collectionName).add(data);
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
  Future<List<Map<String, dynamic>>> getDocuments({
    required String collectionName,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>> collection)? queryBuilder,
  }) async {
    final collection = firestore.collection(collectionName);
    final query = queryBuilder?.call(collection) ?? collection;
    return await query.get().then((value) => value.docs.map((e) => e.data()).toList());
  }
}
