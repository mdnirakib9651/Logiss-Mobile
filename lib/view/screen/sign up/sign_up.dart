import 'package:flutter/material.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/verify%20phone%20number/verify_phone_number.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController homeZipCodeController = TextEditingController();

  bool emailExists = false;
  bool emailInvalid = false;

  // void _validateEmail() {
  //   setState(() {
  //     if (emailController.text.isEmpty) {
  //       emailExists = false;
  //       emailInvalid = true;
  //     } else if (!emailController.text.contains('@')) {
  //       emailExists = false;
  //       emailInvalid = true;
  //     } else {
  //       // TODO: Check if email exists in database and update emailExists accordingly
  //       emailExists = false;
  //       emailInvalid = false;
  //     }
  //   });
  // }


  bool allFieldsFilled = false;
  // int _value = -1;
  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_checkAllFieldsFilled);
    lastNameController.addListener(_checkAllFieldsFilled);
    emailController.addListener(_checkAllFieldsFilled);
    homeZipCodeController.addListener(_checkAllFieldsFilled);
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
  }

  void _checkAllFieldsFilled() {
    setState(() {
      allFieldsFilled = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          homeZipCodeController.text.isNotEmpty;
    });
  }

  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;
  // late FocusNode _focusNode;

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
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
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 12,
                    width: 40,
                    decoration: BoxDecoration(
                        color: ColorResources.yellow,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: ColorResources.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: ColorResources.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15,)
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
                  Text("Sign up", style: latoBold.copyWith(fontSize: 40, color: ColorResources.black),),
                  const SizedBox(height: 25,),
                  TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "First name",
                      labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Fast Name can't be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                  ),
                  // Focus(
                  //   focusNode: _firstNameFocusNode,
                  //   child: Container(
                  //     height: 50,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(12),
                  //         border: _firstNameFocusNode.hasFocus ? Border.all(color: Colors.black, width: 2) : Border.all(color: Colors.grey,)
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 10),
                  //       child: TextFormField(
                  //         controller: firstNameController,
                  //         keyboardType: TextInputType.name,
                  //         decoration: InputDecoration(
                  //           focusedBorder: InputBorder.none,
                  //           labelText: "First name",
                  //           labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                  //         ),
                  //         validator: (value) {
                  //           if(value!.isEmpty){
                  //             return "Fast Name can't be empty";
                  //           }
                  //           return null;
                  //         },
                  //         cursorColor: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 15,),
                  // Focus(
                  //   focusNode: _lastNameFocusNode,
                  //   child: Container(
                  //     height: 50,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(12),
                  //         border: _lastNameFocusNode.hasFocus ? Border.all(color: Colors.black, width: 2) : Border.all(color: Colors.grey,)
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 10),
                  //       child: TextFormField(
                  //         controller: lastNameController,
                  //         keyboardType: TextInputType.name,
                  //         decoration: InputDecoration(
                  //           focusedBorder: InputBorder.none,
                  //           labelText: "Last name",
                  //           labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                  //         ),
                  //         validator: (value) {
                  //           if(value!.isEmpty){
                  //             return "Fast Name can't be empty";
                  //           }
                  //           return null;
                  //         },
                  //         cursorColor: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Last name",
                      labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                    cursorColor: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email address",
                      labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                      // errorText: emailInvalid ? 'Invalid email' : null,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Address can't be empty";
                      }
                      return null;
                    },
                    // validator: (value) {
                    //   if (emailController.text.isEmpty) {
                    //     emailExists = false;
                    //     emailInvalid = true;
                    //     return "Email can't be empty";
                    //   } else if (!emailController.text.contains('@')) {
                    //     emailExists = false;
                    //     emailInvalid = true;
                    //     return ""
                    //   } else {
                    //     emailExists = false;
                    //     emailInvalid = false;
                    //   }
                    // },
                    cursorColor: Colors.grey,
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: homeZipCodeController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Home zip code",
                      labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                    cursorColor: Colors.grey,
                  ),
                ],
              ),
              Expanded(child: Container()),
              firstNameController.text.isNotEmpty ?
              InkWell(
                onTap: (){
                  allFieldsFilled ? Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyPhoneNumber())) : const SizedBox();
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: allFieldsFilled ? ColorResources.yellow : ColorResources.grey,
                  ),
                  child: Center(child: Text("Next", style: latoBold.copyWith(color: allFieldsFilled ? ColorResources.white : ColorResources.black, fontSize: 20),),),
                ),
              ) : const SizedBox(),
            ],
          ),
        )
    );
  }
}
