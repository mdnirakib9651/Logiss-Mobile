import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logiss_mobile/main.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'enavle_image_preview.dart';

class EnabledCamera extends StatefulWidget {
  const EnabledCamera({Key? key}) : super(key: key);

  @override
  State<EnabledCamera> createState() => _EnabledCameraState();
}

class _EnabledCameraState extends State<EnabledCamera> {

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
                        const Icon(Icons.contact_mail_outlined, size: 60, color: ColorResources.white,),
                        Text("Front of your driver's license", style: latoBold.copyWith(fontSize: 25, color: ColorResources.white),),
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
                        Text("Front of your driver's license", style: latoBold.copyWith(fontSize: 25, color: ColorResources.black),),
                        const SizedBox(height: 10,),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text("Make  sure it's a well-lit area. Place card on a flat, empty surface. and position it so that the front of your driver's license fits. in the frame.", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)),
                        const SizedBox(height: 35,),
                        InkWell(
                          onTap: () async {
                            // cameraController.takePicture().then((XFile? file){
                            //   if(mounted){
                            //     if(file != null){
                            //       print("Picture saved to ${file.path}");
                            //     }
                            //   }
                            // });
                            if(!cameraController.value.isInitialized){
                              return null;
                            }
                            if(cameraController.value.isTakingPicture){
                              return null;
                            }
                            try{
                              await cameraController.setFlashMode(FlashMode.auto);
                              XFile file = await cameraController.takePicture();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EnavleImagePreview(file: file,)));
                            } on CameraException catch (e){
                              debugPrint("Error occured while taking picture : $e");
                              return null;
                            }
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
                        )
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
