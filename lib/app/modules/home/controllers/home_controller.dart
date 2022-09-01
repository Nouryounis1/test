import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final databaseRef = FirebaseDatabase.instance.reference();

  final Map<int, String> discBasis = {
    0: 'cool',
    1: 'dry',
    2: 'auto',
    3: 'heat',
    4: 'fan'
  };

  final Map<int, String> fan = {
    0: 'min',
    1: 'mid',
    2: 'max',
    3: 'auto',
  };

  final count = 0.obs;
  RxBool power = false.obs;
  RxString selectedMode = 'cool'.obs;
  RxString selectedFan = 'min'.obs;
  RxInt selctedTemp = 17.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addData() async {
    int? mode;
    int? fans;

    mode = discBasis.keys.firstWhere((element) {
      return discBasis[element]!.contains(selectedMode.value);
    });

    fans = fan.keys.firstWhere((element) {
      return fan[element]!.contains(selectedFan.value);
    });

    databaseRef.child("flutterDevsTeam2").set({
      'power': power.value,
      'mode': mode,
      'fan': fans,
      'temp': selctedTemp.value
    });
  }
}
