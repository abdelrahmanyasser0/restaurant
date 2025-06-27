import 'package:get/get.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/payment_card.dart';
import '../../data/repositories/payment_repo.dart';

class PaymentController extends GetxController {
  final IPaymentRepository repo;

  PaymentController(this.repo);
  final RxInt stat = (-1).obs;
  var cards = <PaymentCard>[].obs;

  final List<Map<String, String>> staticPayments = [
    {'asset': AppAssets.apple, 'text': AppStrings.applePay},
    {'asset': AppAssets.payPal, 'text': AppStrings.paypal},
    {'asset': AppAssets.dollar, 'text': AppStrings.cash},
  ];
  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  void togglePayment(value){
    stat.value=value;
  }

  void fetchCards() async {
    cards.value = await repo.fetchCards();
    print('rrrrrrrrrrrrrrrrrrrrrr${cards.value[0].toString() }');

  }


}
