import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/search/views/searchAvail_view.dart';
import 'package:rentalin_id/app/modules/search/views/searchBooked_view.dart';
import 'package:rentalin_id/app/modules/search/views/searchRent_view.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';

import '../../Rent/views/rent1_view.dart';
import '../controllers/search_controller.dart';
import '../../../data/constant/color.dart';


class SearchView extends GetView<SearchingController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: tdBg,
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScrBar(),

              SizedBox(
                width: 20,
              ),
              Scr(),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          
          ScrOpAll(),

          SizedBox(
            height: 10,
          ),

          CardBooked(),

          CardAvailable(),

          CardRent(),
        ],
      ),
      // bottomNavigationBar: BottomFloatBar()
    );
  }
}

class Scr extends StatelessWidget {
  const Scr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                color: Color(0xff1966FF),
                borderRadius: BorderRadius.circular(30), 
                ),
                child: ElevatedButton(
                  onPressed: () { },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    foregroundColor: tdWhite,
                  ),
                  child: Icon(
                    Icons.search,
                  )
                ),
              );
  }
}

class ScrBar extends StatelessWidget {
  const ScrBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 50,
                width: 284,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff1966FF))
                ),
                child: TextField(
                  cursorColor: tdSecBlue,
                  style: const TextStyle(color: tdBlue, fontSize: 15),
                  decoration: InputDecoration(
                    fillColor: tdWhite,
                    hoverColor: tdSecBlue,
                    filled: true,
                    alignLabelWithHint: false,
                    hintText: "Searching",
                    hintStyle: const TextStyle(color: tdSecBlue),
                  ),
                ),
              );
  }
}

class ScrOpAll extends StatelessWidget {
  const ScrOpAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 30,
                child: ElevatedButton(
                  onPressed: () { Get.to(const SearchView()); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    foregroundColor: tdWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "All",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 98,
                height: 30,
                child: ElevatedButton(
                  onPressed: () { Get.to(const SearchAvailView());},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC7DAFF),
                    foregroundColor: Color(0xff1966FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Available",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
               SizedBox(
                width: 90,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {Get.to(const SearchBookedView()); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC7DAFF),
                    foregroundColor: Color(0xff1966FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Booked",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
               SizedBox(
                width: 92,
                height: 30,
                child: ElevatedButton(
                  onPressed: () { Get.to(const SearchRentView()); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC7DAFF),
                    foregroundColor: Color(0xff1966FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "On Rent",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          );
  }
}

class CardBooked extends StatelessWidget {
  const CardBooked({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
            margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(Rent1View());
                  },
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/Picture/NMAX.png"), 
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("Booked By", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffFF9500)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          Text("Krisna Bimantoro", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("KH 2013 WW", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13, color: tdBlue),),
                          Text("...")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

class CardAvailable extends StatelessWidget {
  const CardAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
            margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(Rent1View());
                  },
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/Picture/NMAX.png"), 
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("Available", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff34C759)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFF9500),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xffFF9500),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xffFF9500),
                              )
                            ],
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Text("KH 2013 WW", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13, color: tdBlue),),
                          Text("...")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

class CardRent extends StatelessWidget {
  const CardRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
            margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(Rent1View());
                  },
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/Picture/NMAX.png"), 
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("On Rent By", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffFF3B30)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          Text("Krisna Bimantoro", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("KH 2013 WW", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13, color: tdBlue),),
                          Text("...")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

