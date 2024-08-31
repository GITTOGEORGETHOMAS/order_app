import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/order_controller.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final OrderController controller = Get.put(OrderController());
  final TextEditingController orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Management"),
        actions: [
          const Icon(Icons.translate),
          Obx(() => Switch(
                value: controller.isEnglish.value,
                onChanged: (value) {
                  controller.toggleLanguage();
                },
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: orderController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'order_number'.tr,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (orderController.text.isNotEmpty) {
                  controller.addOrder(orderController.text);
                  orderController.clear();
                }
              },
              child: Text("add".tr),
            ),
            const SizedBox(height: 20),
            Obx(() => DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        "order_number".tr,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "actions".tr,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    controller.orderList.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(controller.orderList[index])),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () => controller.removeOrder(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.mic, color: Colors.blue),
                                onPressed: () => controller
                                    .speakOrder(controller.orderList[index]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
