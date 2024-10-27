import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

import '../controllers/manage_motorcycle_controller.dart';

class UpdateMotorcycleDetailView extends StatelessWidget {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ManageMotorcycleController _controller = Get.put(ManageMotorcycleController());
  late final String motorcycleId;
  
  Stream<QuerySnapshot> _getTasks() {
    return _firestore.collection('Manage Motorcycle').snapshots();
  }
  
  @override
  Widget build(BuildContext context) {
    _controller.fetchMotorcycleDetails(motorcycleId);
    var data = _controller.motorcycle;
    
    return Scaffold(
      appBar: AppBar(
          // surfaceTintColor: tdGrey,
          scrolledUnderElevation: 0,
          // leadingWidth: 344,
          elevation: 0,
          backgroundColor: tdBg,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const AppBarComponents(
            nameMenu: 'Update Motorcycle',
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 344,
              height: 148,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/img1.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: tdGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              width: 345,
              height: 217,
              margin: EdgeInsets.only(top: 10),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("Merk Motor"),
                      Text("Motor Name"),
                      Text("Type Motor"),
                      Text("Plat Motor"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "",
                      ),
                      Text(data['Merk Motor'] ?? ''),
                      Text(data['Motor Name'] ?? ''),
                      Text(data['Type Motor'] ?? ''),
                      Text(data['Plat Motor'] ?? ''),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Is Recommendation",
                hintText: "Yes",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Price/Day",
                hintText: "Rp. 150.000",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Align buttons evenly
              children: [
                // "Go Back" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      // Define what happens when "Go Back" is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: tdBlue,
                      backgroundColor: Colors.white, // Text color
                      side: BorderSide(color: tdBlue), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // "Add New" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Define what happens when "Add New" is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: tdgreen, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // TODO: implement build
  }
}
