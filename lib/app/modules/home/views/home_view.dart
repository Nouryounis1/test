import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final storeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Power'),
                const SizedBox(
                  width: 10,
                ),
                CupertinoSwitch(
                    value: storeController.power.value,
                    onChanged: (value) {
                      storeController.power.value = value;
                      storeController.addData();
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Mode'),
              const SizedBox(
                width: 20,
              ),
              Obx(
                () => IgnorePointer(
                  ignoring: storeController.power.value == false ? true : false,
                  child: DropdownButton(
                      value: storeController.selectedMode.value,
                      hint: Text('Select Mode'),
                      items:
                          storeController.discBasis.values.map((String items) {
                        return DropdownMenuItem(
                          child: Text(items),
                          value: items,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        storeController.selectedMode.value = value!;
                        storeController.addData();
                      }),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Fan'),
              const SizedBox(
                width: 20,
              ),
              Obx(
                () => IgnorePointer(
                  ignoring: storeController.power.value == false ? true : false,
                  child: DropdownButton(
                      value: storeController.selectedFan.value,
                      hint: Text('Select Fan'),
                      items: storeController.fan.values.map((String items) {
                        return DropdownMenuItem(
                          child: Text(items),
                          value: items,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        storeController.selectedFan.value = value!;
                        storeController.addData();
                      }),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Temp'),
              const SizedBox(
                width: 20,
              ),
              Obx(
                () => IgnorePointer(
                    ignoring:
                        storeController.power.value == false ? true : false,
                    child: NumberPicker(
                      value: storeController.selctedTemp.value,
                      minValue: 17,
                      maxValue: 30,
                      onChanged: (value) {
                        storeController.selctedTemp.value = value;
                        storeController.addData();
                      },
                    )),
              )
            ],
          ),
        ],
      )),
    );
  }
}
