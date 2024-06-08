import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SensorController extends GetxController {
  var isObjectInFront = false.obs;
  var isObjectOnLeft = false.obs;
  var isObjectOnRight = false.obs;
  var frontCounter = 0.obs;
  var leftCounter = 0.obs;
  var rightCounter = 0.obs;
  var errorMessage = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      fetchSensorData();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> fetchSensorData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.100.92/'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double frontDistance = double.tryParse(data['front'].toString()) ?? 0.0;
        double leftDistance = double.tryParse(data['left'].toString()) ?? 0.0;
        double rightDistance = double.tryParse(data['right'].toString()) ?? 0.0;

        if (frontDistance < 20.0) {
          if (!isObjectInFront.value) frontCounter.value++;
          isObjectInFront.value = true;
        } else {
          isObjectInFront.value = false;
        }
        if (leftDistance < 20.0) {
          if (!isObjectOnLeft.value) leftCounter.value++;
          isObjectOnLeft.value = true;
        } else {
          isObjectOnLeft.value = false;
        }
        if (rightDistance < 20.0) {
          if (!isObjectOnRight.value) rightCounter.value++;
          isObjectOnRight.value = true;
        } else {
          isObjectOnRight.value = false;
        }

        errorMessage.value = ''; 
      } else {
        throw Exception('Failed to load sensor data');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    }
  }
}
