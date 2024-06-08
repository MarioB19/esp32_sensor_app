import 'package:esp32_sensor_app/Components/contador_deteccion.dart';
import 'package:esp32_sensor_app/Controllers/sensor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/boton_deteccion.dart';

class SensorDataScreen extends StatelessWidget {
  final SensorController controller = Get.put(SensorController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvRk5_xd-gKpVj8l2Ie3xmxiGP-3_5pW3IbA&s'),
              fit: BoxFit.cover,
            ),
          ),
        ),
 
        Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(0.5), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
         
                Text(
                  'Practica Recoleccion de Datos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
              
                Obx(() => SensorSwitch(
                      label: 'Frontal',
                      isActive: controller.isObjectInFront.value,
                      color: Colors.green,
                    )),
                Obx(() => SensorSwitch(
                      label: 'Izquierda',
                      isActive: controller.isObjectOnLeft.value,
                      color: Colors.green,
                    )),
                Obx(() => SensorSwitch(
                      label: 'Derecha',
                      isActive: controller.isObjectOnRight.value,
                      color: Colors.green,
                    )),
                SizedBox(height: 20),

                Obx(() => controller.errorMessage.value.isNotEmpty
                    ? Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox.shrink()),
             
                Text(
                  'Detecciones:',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
            
                Obx(() => DetectionCounter(
                      label: 'Frontal',
                      count: controller.frontCounter.value,
                      color: Colors.white,
                    )),
                Obx(() => DetectionCounter(
                      label: 'Izquierda',
                      count: controller.leftCounter.value,
                      color: Colors.white,
                    )),
                Obx(() => DetectionCounter(
                      label: 'Derecha',
                      count: controller.rightCounter.value,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}