import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/enable%20camera/enable_camera.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 200,),
                const Icon(Icons.camera_alt, size: 100,),
                Text("Give camera access", style: latoBold.copyWith(fontSize: 30, color: ColorResources.black),),
                const SizedBox(height: 20,),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text("Take a photo of your license to confirm your identity and get approved for deliveries.", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),textAlign: TextAlign.center,)),
              ],
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  EnabledCamera()));
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorResources.yellow,
                ),
                child: Center(child: Text("Enable Camera", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
