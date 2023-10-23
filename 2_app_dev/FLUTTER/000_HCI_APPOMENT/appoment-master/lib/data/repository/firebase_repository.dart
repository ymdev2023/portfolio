import 'package:appoment/data/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FirebaseRepository<T extends Entity> {
  abstract final String collectionName;

  Future<void> save(T entity, {VoidCallback? onError}) async {
    try {
      final exists = (await db.where('id', isEqualTo: entity.id).get()).docs;
      if (exists.isEmpty) {
        await db.add(entity.toJson());
        printInfo(info: 'saved to database: $collectionName');
      } else {
        exists[0].reference.set(entity.toJson(), SetOptions(merge: true));
        printInfo(info: 'updated to database: $collectionName');
      }
    } catch (e) {
      onError?.call();
      printError(info: 'failed to save data: $collectionName');
    }
  }

  Future<void> delete(String id, {VoidCallback? onError}) async {
    try {
      final result = await db.where('id', isEqualTo: id).get();
      if (result.docs.isNotEmpty) {
        final document = result.docs[0];
        await document.reference.delete();
        printInfo(info: 'deleted from database: $collectionName');
      }
    } catch (e) {
      onError?.call();
      printError(info: 'failed to delete data: $collectionName');
    }
  }

  Future<T?> findById(String id) async {
    final result = await db.where('id', isEqualTo: id).get();
    if (result.docs.isEmpty) {
      return null;
    }
    final data = result.docs[0].data();
    return mapItem(data);
  }

  Future<List<T>> findAllByIds(List<String> ids) async {
    final result = await db.where('id', whereIn: ids).get();
    return result.docs.map((doc) => mapItem(doc.data())).toList();
  }

  Stream<T> streamById(String id) {
    return db
        .where('id', isEqualTo: id)
        .snapshots()
        .map((event) => mapItem(event.docs[0].data()));
  }

  Stream<List<T>> streamAllByIds(List<String> ids) {
    return db
        .where('id', whereIn: ids)
        .snapshots()
        .map((event) => event.docs.map((e) => mapItem(e.data())).toList());
  }

  T mapItem(dynamic json);

  @protected
  CollectionReference get db =>
      FirebaseFirestore.instance.collection(collectionName);
}
