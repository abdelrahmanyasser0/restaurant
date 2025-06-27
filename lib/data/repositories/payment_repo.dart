import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/payment_card.dart';

abstract class IPaymentRepository {
  Future<List<PaymentCard>> fetchCards();
  Future<void> addCard(PaymentCard card);
}


class PaymentRepository implements IPaymentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _collectionName = 'cards'; // موحّد

  @override
  Future<List<PaymentCard>> fetchCards() async {
    try {
      final snapshot = await _firestore.collection(_collectionName).get();
      return snapshot.docs.map((doc) => PaymentCard.fromJson(doc.data())).toList();
    } catch (e) {
      print('Error fetching cards: $e');
      return [];
    }
  }

  @override
  Future<void> addCard(PaymentCard card) async {
    final docRef = _firestore.collection(_collectionName).doc();
    await docRef.set(card.copyWith(id: docRef.id).toJson());
  }
}

