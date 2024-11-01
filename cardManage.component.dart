import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/manage_motorcycle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/detail_manage_motorcycle_view.dart';

class CardManageMotor extends StatelessWidget {
  final String motorcycleId;

  const CardManageMotor({
    Key? key,
    required this.motorcycleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageMotorcycleController motorcycleController = Get.find<ManageMotorcycleController>();
    
    // Cari data motor berdasarkan `motorcycleId` di dalam controller
    final motorcycle = motorcycleController.data.firstWhere(
      (motor) => motor.platMotor == motorcycleId,
      orElse: () => null,
    );

    if (motorcycle == null) {
      return Container(
        child: Text("Motor not found"),
      );
    }

    return InkWell(
      onTap: () {
        Get.to(
          DetailManageMotorcycleView(
            motorcycleId: motorcycleId,
          ),
          arguments: motorcycle,
        );
      },
      child: Container(
        width: 344,
        height: 95,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
        decoration: BoxDecoration(
          color: tdWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -3,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 103,
                  height: 85,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/img1.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      motorcycle.typeMotor,
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      motorcycle.motorName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      motorcycle.platMotor,
                      style: TextStyle(fontSize: 11, color: tdGrey),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          motorcycle.pricePerDay.toString(),
                          style: TextStyle(color: tdBlue, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "/Day",
                          style: TextStyle(color: tdGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 33,
                  height: 33,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icon/chevron-right.png"),
                    ),
                    color: tdBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
