import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

typedef DocumentSnapshotQuery = bool Function(QueryDocumentSnapshot);
typedef SnapshotQuery = bool Function(QuerySnapshot);

class Firestore {
  final _firestore = FirebaseFirestore.instance;

  Future<QueryDocumentSnapshot?> getDocument({
    required String collectionPath,
    required DocumentSnapshotQuery snapshotQuery,
  }) async {
    final collection = await getCollection(collectionPath).get();

    return collection.docs.firstWhereOrNull(snapshotQuery);
  }

  Stream<QuerySnapshot<Object?>> getDocumentStream({
    required String collectionPath,
  }) {
    return getCollection(collectionPath).snapshots();
  }

  Future<void> updateDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    return getCollection(collectionPath).doc(docId).update(data);
  }

  Future<void> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    await getCollection(collectionPath).add(data);
  }

  CollectionReference getCollection(String path) {
    return _firestore.collection(path);
  }
}

extension QuerySnapshotExt on QueryDocumentSnapshot {
  Map<String, dynamic> get mappedData => data()! as Map<String, dynamic>;
}
