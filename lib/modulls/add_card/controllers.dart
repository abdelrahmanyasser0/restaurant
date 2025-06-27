import 'package:get/get.dart';
import '../../data/models/payment_card.dart';
import '../../data/repositories/payment_repo.dart';
import 'package:flutter/material.dart';



class AddPaymentController extends GetxController {
  final IPaymentRepository repo;

  AddPaymentController(this.repo);

  // Text Controllers
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  final RxString nameRx = ''.obs;
  final RxString numberRx = ''.obs;
  final RxString expiryRx = ''.obs;

  final formKey = GlobalKey<FormState>();
  var cards = <PaymentCard>[].obs;

  @override
  void onInit() {
    super.onInit();

    cardNameController.addListener(() {
      nameRx.value = cardNameController.text;
    });
    cardNumberController.addListener(() {
      numberRx.value = cardNumberController.text;
    });
    expiryDateController.addListener(() {
      expiryRx.value = expiryDateController.text;
    });
  }

  PaymentCard get currentCard => PaymentCard(
    holderName: cardNameController.text,
    cardNumber: cardNumberController.text,
    expireDate: expiryDateController.text,
    cvv: cvvController.text,
    id: '',
  );

  void onSubmitCard() async {
    final newCard = currentCard;
    await addCard(newCard);
  }

  Future<void> addCard(PaymentCard card) async {
    await repo.addCard(card);
    cards.add(card);
  }

  @override
  void onClose() {
    cardNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }
}

