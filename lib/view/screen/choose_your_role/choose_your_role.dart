import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/images.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/driver%20license/driver_license.dart';

class ChooseYourRole extends StatefulWidget {
  const ChooseYourRole({Key? key}) : super(key: key);

  @override
  State<ChooseYourRole> createState() => _ChooseYourRoleState();
}

class _ChooseYourRoleState extends State<ChooseYourRole> {

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
                  Text("Choose your role", style: latoBold.copyWith(fontSize: 40, color: ColorResources.black),),
                  const SizedBox(height: 25,),
                  Image.asset(Images.image2),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Join a local ream to deliver in the same area everyday, amongst other team drivers", style: latoRegular.copyWith(color: Colors.black87, fontSize: 18),)),
                ],
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: _value == 1 ? Border.all(width: 2, color: Colors.black) : Border.all(width: 1, color: Colors.grey)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(Images.teamPerson, height: 80, width: 80,),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Team driver", style: latoBold.copyWith(color: Colors.black, fontSize: 25),),
                              const SizedBox(height: 5,),
                              Text("Consistent & less flexible", style: latoRegular.copyWith(color: Colors.black87, fontSize: 16),),
                            ],
                          ),
                        ],
                      ),
                      Radio(
                        value: 1,
                        groupValue: _value,
                        activeColor: Colors.black,
                        onChanged: (int? value){
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: _value == 2 ? Border.all(width: 2, color: Colors.black) : Border.all(width: 1, color: Colors.grey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(Images.person, height: 80, width: 80,),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Flex driver", style: latoBold.copyWith(color: Colors.black, fontSize: 25),),
                            const SizedBox(height: 5,),
                            Text("Work anywhere & anytime", style: latoRegular.copyWith(color: Colors.black87, fontSize: 16),),
                          ],
                        ),
                      ],
                    ),
                    Radio(
                        value: 2,
                        groupValue: _value,
                      activeColor: Colors.black,
                      onChanged: (int? value){
                          setState(() {
                            _value = value!;
                          });
                      },
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverLicense()));
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorResources.yellow,
                  ),
                  child: Center(child: Text("Next", style: latoBold.copyWith(color: ColorResources.white, fontSize: 20),),),
                ),
              ),
            ],
          ),
        )
    );
  }
}
