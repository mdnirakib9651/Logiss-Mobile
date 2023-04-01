import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class ScanPackages extends StatefulWidget {
  const ScanPackages({Key? key}) : super(key: key);

  @override
  State<ScanPackages> createState() => _ScanPackagesState();
}

class _ScanPackagesState extends State<ScanPackages> {

  @override
  Widget build(BuildContext context) {
    // SnappingSheet(
    //   snappingPositions: [
    //     SnappingPosition.factor(
    //       positionFactor: 0.0,
    //       snappingCurve: Curves.easeOutExpo,
    //       snappingDuration: Duration(seconds: 1),
    //       grabbingContentOffset: GrabbingContentOffset.top,
    //     ),
    //     SnappingPosition.pixels(
    //       positionPixels: 400,
    //       snappingCurve: Curves.elasticOut,
    //       snappingDuration: Duration(milliseconds: 1750),
    //     ),
    //     SnappingPosition.factor(
    //       positionFactor: 1.0,
    //       snappingCurve: Curves.bounceOut,
    //       snappingDuration: Duration(seconds: 1),
    //       grabbingContentOffset: GrabbingContentOffset.bottom,
    //     ),
    //   ],
    // );

    String data = "6345 6TH AVE S";
    scan() async{
      await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) => setState(() => data = value));
    }

    SnappingSheet(
      sheetAbove: SnappingSheetContent(
        sizeBehavior: const SheetSizeFill(),
        draggable: false,
        child: Container(color: Colors.blue),
      ),
      sheetBelow: SnappingSheetContent(
        sizeBehavior: SheetSizeStatic(size: 300),
        draggable: true,
        child: Container(color: Colors.red),
      ),
    );

    return Scaffold(
      body: SnappingSheet(
        grabbingHeight: 210,
        grabbing: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorResources.grey,
                      ),
                      child: Center(child: Text("1", style: latoBold.copyWith(fontSize: 20, color: ColorResources.black),)),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data, style: latoBold.copyWith(fontSize: 20, color: ColorResources.black),),
                        const SizedBox(height: 5,),
                        Text("Seattle, WA 98105", style: latoRegular.copyWith(color: Colors.black87, fontSize: 14),),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 30),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorResources.grey
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.key, size: 14, color: Colors.white,)),
                        const SizedBox(width: 5,),
                        Text("43123", style: latoBold.copyWith(color: Colors.black87, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorResources.grey
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.message, size: 14, color: Colors.white,)),
                        const SizedBox(width: 5,),
                        SizedBox(
                            width: 250,
                            child: Text("Please come from the back of the building and find the", style: latoBold.copyWith(color: Colors.black87, fontSize: 14),)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        sheetBelow: SnappingSheetContent(
            draggable: true,
            child: Container(
                color: ColorResources.grey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: ColorResources.yellow, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.incomplete_circle, color: ColorResources.yellow, size: 15,),
                              const SizedBox(width: 5,),
                              Text("In progress", style: latoRegular.copyWith(color: ColorResources.yellow, fontSize: 14),)
                            ],
                          ),
                        ),
                        // const SizedBox(height: 20,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 660,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Alireza Togyiani", style: latoBold.copyWith(color: Colors.black87, fontSize: 20),),
                                              Text("Apt 303", style: latoBold.copyWith(color: Colors.black87, fontSize: 20),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(width: 2, color: ColorResources.grey)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.gif_box_rounded, size: 15, color: Colors.grey,),
                                                    const SizedBox(width: 5,),
                                                    Text("1 piece", style: latoRegular.copyWith(color: Colors.black87, fontSize: 14),)
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10,),
                                              Container(
                                                height: 30,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(width: 2, color: ColorResources.grey)
                                                ),
                                                child: Center(child: Text("Notification", style: latoRegular.copyWith(color: Colors.black87, fontSize: 14),)),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            scan();
                          },
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorResources.yellow,
                            ),
                            child: Center(child: Text("Scan packages", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )
        ),
        child: Column(
          children: [
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              // child: scan(),
            ),
          ],
        ),
      ),
    );
  }
}



