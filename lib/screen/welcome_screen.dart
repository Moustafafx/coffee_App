import 'package:flutter/material.dart';
import 'package:flutter_app/screen/Home_Screen.dart';

class welcome_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Material(
  child: Container(
    padding: EdgeInsets.only(top:100,bottom:40  ),
    decoration:BoxDecoration(
      color: Colors.black,
      image:  DecorationImage(
  image: AssetImage("images/coffee_bg.jpg"),
  fit: BoxFit.cover,
  opacity: 0.4,
),),

    child: Column(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
Text("coffe shop"
,style:
TextStyle(fontFamily:"PlayfairDisplay",fontSize: 46,color: Colors.white) ,),


Column(children: [
 Text("feeling low? Take a sip of Coffe ",style: TextStyle(
  color: Colors.white.withOpacity(0.8),
  fontSize: 18,
  fontWeight: FontWeight.w500,
  letterSpacing: 1,  //لضبط المسافة بين الحروف داخل النص. بمعنى آخر، فهي تسمح لك بتوسيع أو تقليص المسافة الفاصلة بين كل حرف وحرف آخر في النص.
 ),) ,

SizedBox(height: 40),

Material(
     color: Color(0xffe57734),

     borderRadius: BorderRadius.circular(10),

  child: InkWell(
  
    onTap: () {
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home_Screen(), ));   
    },
  child: Container(
    padding: EdgeInsets.symmetric(horizontal:30 ,vertical:10 ),
   
    child: Text("Get start",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight:FontWeight.bold,letterSpacing: 1 ),),
  ),
  
  
  ),
),


],)

    ],),
  ),
 );
  }
  
}