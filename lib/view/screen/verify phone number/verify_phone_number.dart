import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logiss_mobile/utill/color_resources.dart';
import 'package:logiss_mobile/utill/style/lato_styles.dart';
import 'package:logiss_mobile/view/screen/verify_sms_code/verify_sms_code.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {

  TextEditingController firstNameController = TextEditingController();


  bool allFieldsFilled = false;
  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_checkAllFieldsFilled);
  }

  void _checkAllFieldsFilled() {
    setState(() {
      allFieldsFilled = firstNameController.text.isNotEmpty;
    });
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
                    width: 12,
                    decoration: BoxDecoration(
                        color: ColorResources.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(width: 4,),
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
                  Text("Verify phone number", style: latoBold.copyWith(fontSize: 40, color: ColorResources.black),),
                  const SizedBox(height: 25,),
                  IntlPhoneField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      labelStyle: latoRegular.copyWith(color: Colors.grey, fontSize: 16,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                    cursorColor: Colors.grey,
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                      child: Text("By clicking Continue, you agree to Turbo's Terms and conditions and acknowledge you have read the Privacy Policy. By Providing my phone number above, I agree and consent to receiving text messages from Turbo. Message and data rates apply. Consent not required to buy. Messages may be auto-dialed. Text STOP to Cancel", style: latoRegular.copyWith(color: Colors.black54, fontSize: 16),)),
                ],
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  allFieldsFilled ? Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifySmsCode())) : const SizedBox();
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: allFieldsFilled ? ColorResources.yellow : ColorResources.grey,
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
