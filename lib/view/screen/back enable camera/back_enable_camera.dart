// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logiss_mobile/main.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/add%20your%20photo/add_your_photo.dart';
import 'package:logiss_mobile/view/screen/back%20enable%20camera/back_enable_preview.dart';

class BackEnabledCamera extends StatefulWidget {

  const BackEnabledCamera({Key? key}) : super(key: key);

  @override
  State<BackEnabledCamera> createState() => _BackEnabledCameraState();
}

class _BackEnabledCameraState extends State<BackEnabledCamera> {

  CameraController cameraController = CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  void startCamera(int direction) async{
    cameraController.initialize().then((value){
      if(!mounted){
        return;
      }

      setState(() {}); //To refresh widget
    }).catchError((e){
      if(e is CameraException){
        switch (e.code){
          case 'CameraAccessDenied':
            print("Access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(cameraController.value.isInitialized){
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(cameraController)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorResources.grey.withOpacity(.1),
                    ),
                    child: const Icon(Icons.close, color: Colors.black,),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.credit_card, size: 40, color: ColorResources.white,),
                        Text("Back of your driver's license", style: latoBold.copyWith(fontSize: 20, color: ColorResources.white),),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorResources.grey.withOpacity(.2),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: ColorResources.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Back of your driver's license", style: latoBold.copyWith(fontSize: 25, color: ColorResources.black),),
                        const SizedBox(height: 10,),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text("Make  sure it's a well-lit area. Place card on a flat, empty surface. and position it so that the front of your driver's license fits. in the frame.", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)),
                        const SizedBox(height: 35,),
                        InkWell(
                          onTap: () /*async */{
                            // if(!cameraController.value.isInitialized){
                            //   return null;
                            // }
                            // if(cameraController.value.isTakingPicture){
                            //   return null;
                            // }
                            // try{
                            //   await cameraController.setFlashMode(FlashMode.auto);
                            //   XFile file = await cameraController.takePicture();
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=> BackEnavleImagePreview(file: file,)));
                            // } on CameraException catch (e){
                            //   debugPrint("Error occured while taking picture : $e");
                            //   return null;
                            // }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddYourPhoto()));
                          },
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorResources.yellow,
                            ),
                            child: Center(child: Text("Scan", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else{
      return Container();
    }
  }
}
