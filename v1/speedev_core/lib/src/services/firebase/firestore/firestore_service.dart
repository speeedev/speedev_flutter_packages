import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:speedev_core/src/models/result_model.dart';

abstract class SDFirebaseFirestoreServiceAbstract {
  FirebaseFirestore get firestore;

  Future<SDResult<DocumentReference>> addDocument({required String collectionName, String? documentId, required Map<String, dynamic> data});

  Future<SDResult<void>> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data});

  Future<SDResult<void>> deleteDocument({required String collectionName, required String documentId});

  Future<SDResult<Map<String, dynamic>>> getDocument({required String collectionName, required String documentId});

  Future<SDResult<List<Map<String, dynamic>>>> getDocuments({
    required String collectionName,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>> collection)? queryBuilder,
  });
}

class SDFirebaseFirestoreService implements SDFirebaseFirestoreServiceAbstract {
  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<SDResult<DocumentReference>> addDocument({
    required String collectionName,
    String? documentId,
    required Map<String, dynamic> data,
  }) async {
    final collection = firestore.collection(collectionName);

    if (documentId != null) {
      final docRef = collection.doc(documentId);
      await docRef.set(data);
      return SDResult(data: docRef, isSuccess: true);
    } else {
      final docRef = await collection.add(data);
      return SDResult(data: docRef, isSuccess: true);
    }
  }

  @override
  Future<SDResult<void>> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data}) async {
    await firestore.collection(collectionName).doc(documentId).update(data);
    return SDResult(data: null, isSuccess: true);
  }

  @override
  Future<SDResult<void>> deleteDocument({required String collectionName, required String documentId}) async {
    await firestore.collection(collectionName).doc(documentId).delete();
    return SDResult(data: null, isSuccess: true);
  }

  @override
  Future<SDResult<Map<String, dynamic>>> getDocument({required String collectionName, required String documentId}) async {
    return SDResult(data: await firestore.collection(collectionName).doc(documentId).get().then((value) => value.data() as Map<String, dynamic>), isSuccess: true);
  }

  @override
  Future<SDResult<List<Map<String, dynamic>>>> getDocuments({
    required String collectionName,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>> collection)? queryBuilder,
  }) async {
    final collection = firestore.collection(collectionName);
    final query = queryBuilder?.call(collection) ?? collection;
    return SDResult(data: await query.get().then((value) => value.docs.map((e) => e.data()).toList()), isSuccess: true);
  }
}
