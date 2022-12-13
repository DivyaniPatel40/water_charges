import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/size_constants.dart';

import '../../theme.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/default_custom_button.dart';

class payment_details extends StatefulWidget {
  const payment_details({Key? key}) : super(key: key);

  @override
  State<payment_details> createState() => _payment_detailsState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
TextEditingController payMyBalance = new TextEditingController();
TextEditingController indicatorController = new TextEditingController();
TextEditingController indicatorControllern = new TextEditingController();

class _payment_detailsState extends State<payment_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/wsp/background_full.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            SingleChildScrollView(
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,
                decoration: new BoxDecoration(

                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(

                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.height * .06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffedf6ff),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Center(
                              child: Image.asset("assets/wsp/drop.png",color: Colors.green,height: 50,width: 50,)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(tr("water_supply_charges"),style: TextStyle(color: Colors.white),),
                    SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        child: ListView(
                          children: [
                            Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //margin: EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.33,
                              //height: 300,
                              child: Column(
                                children: [
                                  Container(
                                    color: Colorss.textfiledbackground,
                                    height: 61,
                                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                    child: Row(

                                      children: [
                                        Card(
                                          child: Image.asset("assets/images/userprofile.png"),
                                        ),
                                        width10SizedBox,
                                        Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("dataClaudia Welch",style: TextStyle(fontSize: 16, fontFamily:'Metropolis',color: Colors.black),),
                                              height5SizedBox,
                                              Text("claudia_welch@gmail.com",style: TextStyle(fontSize: 12, fontFamily:'Metropolis',color: Color(0xff9E9E9E)),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  height20SizedBox,
                                  Container(
                                    margin: EdgeInsets.only(left: 20,right: 20),
                                    child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Phone number:",style: TextStyle(fontSize: 14),),
                                              Text("+1 202 555 0174",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Account number:",style: TextStyle(fontSize: 14),),
                                              Text("2356 7675 7565",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("My Balance:",style: TextStyle(fontSize: 14),),
                                              Text("9.40 TMT",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Discount:",style: TextStyle(fontSize: 14),),
                                              Text("10% on payment date",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Payment:",style: TextStyle(fontSize: 14),),
                                              Text("21st March, 2021",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height20SizedBox,
                                        ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                            height20SizedBox,

                            Text("Pay to my balance",style: TextStyle(fontSize: 14),),
                            height10SizedBox,
                            CustomTextField(

                              text: 'Enter your balance',
                              obscure: false,
                              controller: payMyBalance,
                            ),

                            height20SizedBox,
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              //margin: EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.35,
                                //height: 300,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colorss.textfiledbackground,
                                      ),
                                      width: MediaQuery.of(context).size.width,

                                      height: 38,
                                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                      child: Center(child: Text("Suw",style: TextStyle(fontSize: 16),)),
                                    ),
                                    height20SizedBox,
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Rate:",style: TextStyle(fontSize: 14),),
                                              Text("9.40 TMT",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Debt:",style: TextStyle(fontSize: 14),),
                                              Text("2356 7675 7565",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Payment:",style: TextStyle(fontSize: 14),),
                                              Text("21st March, 2021",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Usage Indicator:",style: TextStyle(fontSize: 14),),
                                              Text("15",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("New Indicator:",style: TextStyle(fontSize: 14),),
                                              Text("",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height10SizedBox,
                                          CustomTextField(

                                            text: 'Enter your new indicator',
                                            obscure: false,
                                            controller: indicatorController,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            height20SizedBox,
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              //margin: EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.35,
                                //height: 300,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colorss.textfiledbackground,
                                      ),
                                      width: MediaQuery.of(context).size.width,

                                      height: 38,
                                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                      child: Center(child: Text("Suw",style: TextStyle(fontSize: 16),)),
                                    ),
                                    height20SizedBox,
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Rate:",style: TextStyle(fontSize: 14),),
                                              Text("9.40 TMT",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Debt:",style: TextStyle(fontSize: 14),),
                                              Text("2356 7675 7565",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Payment:",style: TextStyle(fontSize: 14),),
                                              Text("21st March, 2021",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Usage Indicator:",style: TextStyle(fontSize: 14),),
                                              Text("15",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("New Indicator:",style: TextStyle(fontSize: 14),),
                                              Text("",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height10SizedBox,
                                          CustomTextField(

                                            text: 'Enter your new indicator',
                                            obscure: false,
                                            controller: indicatorControllern,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            height20SizedBox,
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              //margin: EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                //height: 300,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colorss.textfiledbackground,
                                      ),
                                      width: MediaQuery.of(context).size.width,

                                      height: 38,
                                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                      child: Center(child: Text("Lagym",style: TextStyle(fontSize: 16),)),
                                    ),
                                    height20SizedBox,
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Rate:",style: TextStyle(fontSize: 14),),
                                              Text("9.40 TMT",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Number of residents:",style: TextStyle(fontSize: 14),),
                                              Text("2",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Debt:",style: TextStyle(fontSize: 14),),
                                              Text("4.0 TMT",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),
                                          height15SizedBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Last Payment:",style: TextStyle(fontSize: 14),),
                                              Text("21st March, 2021",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height30SizedBox,
                    Center(
                      child: DefaultCustomButton(
                        text: "PAY",
                        onPressed: (){},
                      ),),
                    height20SizedBox,
                  ],

                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
