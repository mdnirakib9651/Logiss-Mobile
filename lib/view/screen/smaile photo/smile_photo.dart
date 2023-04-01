import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logiss_mobile/main.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';

import 'smile_image_preview.dart';

class SmilePhoto extends StatefulWidget {
  const SmilePhoto({Key? key}) : super(key: key);

  @override
  State<SmilePhoto> createState() => _SmilePhotoState();
}

class _SmilePhotoState extends State<SmilePhoto> {

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
              SizedBox(
                height: 300,
                width: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: CameraPreview(cameraController)),
              ),
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Smaile for the photo", style: latoBold.copyWith(fontSize: 30, color: ColorResources.black),),
                  const SizedBox(height: 5,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Take a good selife so we can verify your identify", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb_outline, color: Colors.grey,),
                            Text("In a place with plenty of light", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Icon(Icons.perm_contact_calendar_outlined, color: Colors.grey,),
                            Text("Stand in front of a plain background", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Icon(Icons.sailing, color: Colors.grey,),
                            Text("In a place with plenty of light", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SmilePhotoPreview(file: file,)));
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
        )
    );
  }
}
