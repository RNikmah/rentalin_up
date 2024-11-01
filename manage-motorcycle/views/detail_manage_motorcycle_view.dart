import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/update_motorcycle_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/manage_motorcycle_controller.dart';

class DetailManageMotorcycleView extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ManageMotorcycleController _controller = Get.put(ManageMotorcycleController());
  final String motorcycleId;

  DetailManageMotorcycleView({super.key, required this.motorcycleId});

  @override
  Widget build(BuildContext context) {
    // Fetch motorcycle details based on the motorcycleId
    _controller.fetchMotorcycleDetails(motorcycleId);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 80,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(
          nameMenu: 'Detail Manage Motorcycle',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Obx(() {
          // Observe the motorcycle data from the controller
          final data = _controller.motorcycle.value;
          
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 344,
                    height: 148,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/img1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: tdGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 345,
                    height: 217,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Motor",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Merk Motor'),
                            Text('Motor Name'),
                            Text('Type Motor'),
                            Text('Plat Motor'),
                            Text(
                              'Price',
                              style: TextStyle(color: tdgreen),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(""),
                            Text(data.merkMotor),
                            Text(data.motorName),
                            Text(data.typeMotor),
                            Text(data.platMotor),
                            Text(
                              data.pricePerDay.toString(),
                              style: const TextStyle(color: tdgreen),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 220),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 163,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool? confirmDelete = await _showDeleteDialog(context);
                        if (confirmDelete == true) {
                          await _firestore
                              .collection('Manage Motorcycle')
                              .doc(motorcycleId)
                              .delete();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 163,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(UpdateMotorcycleView(), arguments: data);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: tdorange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

Future<bool?> _showDeleteDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hapus Motor'),
        content: const Text('Apakah Anda yakin ingin menghapus Motor ini?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Hapus'),
          ),
        ],
      );
    },
  );
}
