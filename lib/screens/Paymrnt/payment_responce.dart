import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/size_constants.dart';

import '../../theme.dart';

class payment_responce extends StatefulWidget {
  const payment_responce({Key? key}) : super(key: key);

  @override
  State<payment_responce> createState() => _payment_responceState();
}

class _payment_responceState extends State<payment_responce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/wsp/Group 42.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
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
                    height20SizedBox,
                    Text(tr("water_supply_charges"),style: TextStyle(color: Colors.white),),
                   height50SizedBox,
                    Card(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
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
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: failuretoPay(),
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
    );
  }
  successfulPayment(){
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: MediaQuery.of(context).size.height *0.58,
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/wsp/Smile Circle.png",height: 84,width: 84,),
            ),
            height20SizedBox,
            Center(
              child: Text("Successful Payment",style: TextStyle(fontSize: 25,color: Colorss.textColorGreen),),
            ),
            height30SizedBox,
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction ID:",style: TextStyle(fontSize: 14),),
                      Text("+1 202 555 0174",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                    ],
                  ),
                  height15SizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rate:",style: TextStyle(fontSize: 14),),
                      Text("\$28.2",style: TextStyle(fontSize: 14,color: Colorss.textColorGreen),),
                    ],
                  ),
                ],
              ),
            ),
            height30SizedBox,
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: MediaQuery.of(context).size.width *0.7,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text("Thank You!",style: TextStyle(fontSize: 18,color: Colors.grey),)),
            ),
            height30SizedBox,
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width *0.7,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(child: Text("Thank You!",style: TextStyle(fontSize: 18,color: Colors.grey),)),
              ),
            ),
            height20SizedBox,
          ],
        ),
      ),
    ]
    );
  }
  failuretoPay(){
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: MediaQuery.of(context).size.height *0.58,
        child: Column(
          children: [
            Container(
              child: Center(
                child: Image.asset("assets/wsp/Sad Circle.png",height: 84,width: 84,),
              ),
            ),
            height20SizedBox,
            Container(
              child: Center(
                child: Text("Failure to pay",style: TextStyle(fontSize: 25,color: Colorss.textColorRed),),
              ),
            ),
            height30SizedBox,
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction ID:",style: TextStyle(fontSize: 14),),
                      Text("+1 202 555 0174",style: TextStyle(fontSize: 14,color: Colorss.textColorRed),),
                    ],
                  ),
                  height15SizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rate:",style: TextStyle(fontSize: 14),),
                      Text("\$28.2",style: TextStyle(fontSize: 14,color: Colorss.textColorRed),),
                    ],
                  ),
                ],
              ),
            ),
            height30SizedBox,
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: MediaQuery.of(context).size.width *0.7,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text("Thank You!",style: TextStyle(fontSize: 18,color: Colors.grey),)),
            ),
            height20SizedBox
          ],
        ),
      ),
    ]
    );
  }
}
