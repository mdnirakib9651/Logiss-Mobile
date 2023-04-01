// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';

class SmilePhotoPreview extends StatefulWidget {
  XFile file;
  SmilePhotoPreview({Key? key,required this.file}) : super(key: key);

  @override
  State<SmilePhotoPreview> createState() => _SmilePhotoPreviewState();
}

class _SmilePhotoPreviewState extends State<SmilePhotoPreview> {

  // int _value = 1;
  bool allFieldsFilled = false;
  // @override
  // void initState() {
  //   super.initState();
  //   // firstNameController.addListener(_checkAllFieldsFilled);
  // }
  //
  // void _checkAllFieldsFilled() {
  //   setState(() {
  //     // allFieldsFilled = firstNameController.text.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
        // backgroundColor: ColorResources.white,
        appBar: AppBar(
          backgroundColor: ColorResources.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: ColorResources.black,)),
            ],
          ),
        ),
        body: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.file(picture, height: 300, width: 300, fit: BoxFit.fill,)),
            Expanded(child: Container()),
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("How does it look?", style: latoBold.copyWith(fontSize: 25, color: ColorResources.black),),
                        const SizedBox(height: 10,),
                        Text("Make sure your face is centered and visible. This will prevent any delays in your process", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)
                      ],
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorResources.yellow,
                        ),
                        child: Center(child: Text("Looks good", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorResources.grey,
                        ),
                        child: Center(child: Text("Retake", style: latoBold.copyWith(color: ColorResources.black, fontSize: 20),),),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
