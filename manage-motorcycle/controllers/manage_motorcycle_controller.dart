import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/motorcycle.dart';

class ManageMotorcycleController extends GetxController {
  //TODO: Implement ManageMotorcycleController
  //  static const String _baseUrl = 'http://10.0.2.2:4300/';
  // static const String _category = 'motor';

  // RxList<Datum> data = RxList<Datum>([]);
  // RxBool isLoading = false.obs;

  // @override
  // void onInit() async {
  //   await fetchArticles();
  //   super.onInit();
  // }

  // Future<void> fetchArticles() async{
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${_baseUrl}$_category'));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       final jsonData = response.body;
  //       final result = Motor.fromJson(json.decode(jsonData));
  //       data.value = result.data;
  //       // articles.value = articlesResult.articles;
  //     }else{
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('An error occurred :$e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  // static const String _baseUrl = 'http://10.0.2.2:4300/';

 final CollectionReference motorcyclesCollection =
      FirebaseFirestore.instance.collection('motorcycles');

  var motorcycles = <Motorcycle>[].obs;
  Rxn<Motorcycle> motorcycle = Rxn<Motorcycle>(); // Menyimpan detail motor
  var isLoading = false.obs;

  get data => null;

  @override
  void onInit() {
    super.onInit();
    fetchMotorcycles();
  }

  void fetchMotorcycles() {
    motorcyclesCollection.snapshots().listen((snapshot) {
      motorcycles.value = snapshot.docs
          .map((doc) => Motorcycle.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  void fetchMotorcycleDetails(String motorcycleId) async {
    try {
      isLoading.value = true;
      DocumentSnapshot doc = await motorcyclesCollection.doc(motorcycleId).get();
      if (doc.exists) {
        motorcycle.value = Motorcycle.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        motorcycle.value = null;
      }
    } catch (e) {
      print("Error fetching motorcycle details: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteMotorcycle(String id) async {
    try {
      await motorcyclesCollection.doc(id).delete();
      motorcycles.removeWhere((m) => m.platMotor == id);
    } catch (e) {
      print("Error deleting motorcycle: $e");
    }
  }

  // Future<void> fetchArticles() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${_baseUrl}$_category'));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       final jsonData = response.body;
  //       final result = Motor.fromJson(json.decode(jsonData));
  //       data.value = result.data;
  //       // articles.value = articlesResult.articles;
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('An error occurred :$e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'motorcycle_model.dart';

// class MotorcycleController extends GetxController {
//   final CollectionReference motorcyclesCollection =
//       FirebaseFirestore.instance.collection('motorcycles');

//   var motorcycles = <Motorcycle>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMotorcycles();
//   }

//   // Create
//   Future<void> addMotorcycle(Motorcycle motorcycle) async {
//     try {
//       DocumentReference docRef = await motorcyclesCollection.add(motorcycle.toMap());
//       motorcycles.add(Motorcycle(
//         merkMotor: motorcycle.merkMotor,
//         motorName: motorcycle.motorName,
//         typeMotor: motorcycle.typeMotor,
//         platMotor: motorcycle.platMotor,
//         pricePerDay: motorcycle.pricePerDay,
//         isRecommended: motorcycle.isRecommended,
//       ));
//     } catch (e) {
//       print("Error adding motorcycle: $e");
//     }
//   }

//   // Read
//   void fetchMotorcycles() {
//     motorcyclesCollection.snapshots().listen((snapshot) {
//       motorcycles.value = snapshot.docs
//           .map((doc) => Motorcycle.fromMap(doc.data() as Map<String, dynamic>))
//           .toList();
//     });
//   }

//   // Update
//   Future<void> updateMotorcycle(String id, Motorcycle motorcycle) async {
//     try {
//       await motorcyclesCollection.doc(id).update(motorcycle.toMap());
//       int index = motorcycles.indexWhere((m) => m.platMotor == id);
//       if (index != -1) {
//         motorcycles[index] = motorcycle;
//       }
//     } catch (e) {
//       print("Error updating motorcycle: $e");
//     }
//   }

//   // Delete
//   Future<void> deleteMotorcycle(String id) async {
//     try {
//       await motorcyclesCollection.doc(id).delete();
//       motorcycles.removeWhere((m) => m.platMotor == id);
//     } catch (e) {
//       print("Error deleting motorcycle: $e");
//     }
//   }
// }
