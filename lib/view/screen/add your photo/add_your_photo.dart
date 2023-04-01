import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/images.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/driver%20license/driver_license.dart';

import '../smaile photo/smile_photo.dart';

class AddYourPhoto extends StatefulWidget {
  const AddYourPhoto({Key? key}) : super(key: key);

  @override
  State<AddYourPhoto> createState() => _AddYourPhotoState();
}

class _AddYourPhotoState extends State<AddYourPhoto> {

  int _value = 1;
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
    return Scaffold(
        backgroundColor: ColorResources.white,
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
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your photo", style: latoBold.copyWith(fontSize: 40, color: ColorResources.black),),
                  const SizedBox(height: 25,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("To ensure your account is secure, take a photo of your face so we can match it to your license.", style: latoRegular.copyWith(color: Colors.black87, fontSize: 22),)),
                  Image.asset(Images.personPhoto),
                ],
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SmilePhoto()));
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorResources.yellow,
                  ),
                  child: Center(child: Text("Take photo", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
                ),
              ),
            ],
          ),
        )
    );
  }
}
