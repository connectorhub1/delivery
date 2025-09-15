import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as img_lib;

class ImageUploadService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String folder) async {
    // Compress image before upload (simple resize)
    final bytes = await file.readAsBytes();
    final image = img_lib.decodeImage(bytes);
    final resized = img_lib.copyResize(image!, width: 800);
    final compressedBytes = img_lib.encodeJpg(resized, quality: 80);

    final ref = _storage.ref('$folder/${const Uuid().v4()}.jpg');
    final uploadTask = await ref.putData(compressedBytes);
    return await uploadTask.ref.getDownloadURL();
  }
}