import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/images.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/take%20a%20photo/take%20a%20photo.dart';

class DriverLicense extends StatefulWidget {
  const DriverLicense({Key? key}) : super(key: key);

  @override
  State<DriverLicense> createState() => _DriverLicenseState();
}

class _DriverLicenseState extends State<DriverLicense> {

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
                  Text("Choose your role", style: latoBold.copyWith(fontSize: 40, color: ColorResources.black),),
                  const SizedBox(height: 25,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Take a photo of your license to confirm your identity and get approved for deliveries.", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)),
                  Image.asset(Images.driveLicense),
                ],
              ),
              const SizedBox(height: 20,),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TakePhoto()));
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
