import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/Paymrnt/payment_responce.dart';
import 'package:untitled/screens/searchphoneaddress/searchphoneaddress.dart';
import 'package:untitled/utils/utils.dart';
import 'package:untitled/widgets/size_constants.dart';
//
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
bool _enabled = true;

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

            Row(
              children: [
                Image.asset(
                  "assets/wsp/Group 42.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
            Positioned(
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
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Ink(
                              child: Icon(Icons.arrow_back),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              sidemenu();
                            },
                            child: Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Image.asset('assets/wsp/Settings Minimalistic.png'),
                            ),
                          ),
                        ],
                      ),
                    ),

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
                    SizedBox(height: 50,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: ListView(
                          children: [
                            Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(

                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colorss.textfiledbackground,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 61,
                                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/wsp/profilepic.png"),
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
                            Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                  itemBuilder: (c , i){
                                  return Container(
                                    child: servicespaymentdetails(),
                                  );
                              }),
                            ),
                            height20SizedBox,
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Container(
                                child: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
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
                                          height20SizedBox,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            height30SizedBox,
                            Card(
                              color: Colorss.textfiledbackground,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 38,
                                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                                    child: Center(child: Text("Payment Summary",style: TextStyle(fontSize: 16),)),
                                  ),
                                  height20SizedBox,
                                  Container(
                                    margin: EdgeInsets.only(left: 20,right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Total Deduction::",style: TextStyle(fontSize: 14),),
                                            Text( "\$28.2",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                                          ],
                                        ),
                                        height10SizedBox
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height30SizedBox,
                            Center(
                              child: DefaultCustomButton(
                                text: "PAY",
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => payment_responce()));
                                },
                              ),),
                            height20SizedBox,
                          ],
                        ),
                      ),
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),


    );
  }


sidemenu(){
    return showMenu<String>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13))),
      context: context,
      position:RelativeRect.fromLTRB(
          1,0,0,0),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          child: Container(
              alignment: Alignment.topRight,
              color: Colors.transparent,
              child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/wsp/Close Circle.png',height: 20,width: 20,),
                          ],
                        ),
                      ),
                      height10SizedBox,
                      Container(
                        decoration: BoxDecoration(
                          color: Colorss.textfiledbackground,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        height: 61,

                        child: Row(

                          children: [
                            Image.asset("assets/wsp/profilepic.png"),
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
                      height10SizedBox,
                      Center(child: Text("Choose your language",style: TextStyle(fontFamily: 'Metropolis',fontSize: 12,color: Color(0xff9E9E9E)),)),
                      height20SizedBox,
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Center(
                          child: Text("Türkmen",style: TextStyle(fontSize: 14,fontFamily: 'Metropolis'),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colorss.textfiledbackground,
                        ),
                      ),
                      height10SizedBox,
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Center(
                          child: Text("Русский",style: TextStyle(fontSize: 14,fontFamily: 'Metropolis'),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colorss.textfiledbackground,
                        ),
                      ),
                      height10SizedBox,
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Center(
                          child: Text("English",style: TextStyle(fontSize: 14,fontFamily: 'Metropolis'),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colorss.textfiledbackground,
                        ),
                      ),
                      height20SizedBox,
                      Center(child: Text("Sign out your account",style: TextStyle(fontSize: 12,color: Color(0xff9E9E9E),
                          fontFamily: 'Metropolis'),)),

                      height10SizedBox,
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: SizedBox(
                          width: 250,
                          height: 35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: context.locale == Locale('ar', 'AL') ? 10 : 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Image.asset("assets/wsp/Logout.png"),
                                  Text(
                                    "SIGN OUT".toUpperCase(),
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 50),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),

                        ),
                      ),

                    ],
                  ))),
        ),
      ],
      elevation: 8.0,
    );
}

servicespaymentdetails(){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      //margin: EdgeInsets.only(left: 15,right: 15),
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.35,
        //height: 300,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
                  height20SizedBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
}
