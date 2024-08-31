import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'order_number': 'Order Number',
          'add': 'Add',
          'actions': 'Actions',
          'speak': 'Speak',
        },
        'ar_SA': {
          'order_number': 'رقم الطلب',
          'add': 'أضف',
          'actions': 'إجراءات',
          'speak': 'تحدث',
        },
      };
}
