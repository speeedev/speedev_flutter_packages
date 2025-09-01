import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedev_core/src/models/result_model.dart';

abstract class SDFirebaseStorageServiceAbstract {
  Future<SDResult<String>> uploadFile({required String path, required String fileName, required File file});

  Future<SDResult<File>> downloadFile({required String path, String? fileName});

  Future<SDResult<bool>> deleteFile({required String path});

  Future<SDResult<String>> getDownloadUrl({required String path});
}

class SDFirebaseStorageService implements SDFirebaseStorageServiceAbstract {
  @override
  Future<SDResult<String>> uploadFile({required String path, required String fileName, required File file}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);
      await uploadTask.whenComplete(() => null);
      final url = await ref.getDownloadURL();

      return SDResult(data: url, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<File>> downloadFile({required String path, String? fileName}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);

      final storageFileName = fileName ?? path.split('/').last;

      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${dir.path}/${timestamp}_$storageFileName';

      final file = File(filePath);

      await ref.writeToFile(file);

      return SDResult(data: file, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<bool>> deleteFile({required String path}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      await ref.delete();
      return SDResult(data: true, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }

  @override
  Future<SDResult<String>> getDownloadUrl({required String path}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return SDResult(data: url, isSuccess: true);
    } catch (e) {
      return SDResult(errorMessage: e.toString(), isSuccess: false);
    }
  }
}
