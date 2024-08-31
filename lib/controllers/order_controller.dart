import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OrderController extends GetxController {
  var orderList = <String>[].obs;
  var isEnglish = true.obs;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() {
    super.onInit();
  }

  void toggleLanguage() {
    isEnglish.value = !isEnglish.value;
    if (isEnglish.value) {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ar', 'SA'));
    }
  }

  void addOrder(String orderNumber) {
    orderList.add(orderNumber);
  }

  void removeOrder(int index) {
    orderList.removeAt(index);
  }

  void speakOrder(String orderNumber) async {
    String textToSpeak = "${'order_number'.tr}: $orderNumber";
    await flutterTts.speak(textToSpeak);
  }
}
