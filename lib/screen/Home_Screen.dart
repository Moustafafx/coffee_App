import 'package:flutter/material.dart';
import 'package:flutter_app/cubites/getdatadrinks/cubit/drinkes_cubit.dart';
import 'package:flutter_app/home_bottom%20bar.dart';
import 'package:flutter_app/items_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Home_Screen extends StatefulWidget{


@override
  State<Home_Screen> createState()=>_Home_Screen();
    
    
  

} 
class _Home_Screen extends  State<Home_Screen>with SingleTickerProviderStateMixin {

late TabController tapcontroller;


@override
  void initState() {
     tapcontroller=TabController(length:2 , vsync:this,initialIndex:0 ) ;
      tapcontroller.addListener(handleTapselection);
      context.read<DrinkesCubit>().getdrinks("hot");
    super.initState();
  }


handleTapselection() {
  if (tapcontroller.indexIsChanging) {
    if (tapcontroller.index == 0) {
      context.read<DrinkesCubit>().getdrinks("hot"); 
    } else {
      context.read<DrinkesCubit>().getdrinks("iced");
    }

    setState(() {});
  }
}

@override
  void dispose() {
 tapcontroller.dispose();// دا معاناه انه لما اقفل الصفحه كل الكلام دا يتقفل 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
body:SafeArea
// SafeArea هي ويدجت مهمة في Flutter تساعد في تصميم واجهات مستخدم تتناسب بشكل جيد مع مختلف أنواع الشاشات والأجهزة، خاصة تلك التي تحتوي على عناصر نظام تشغيل مثل شريط الحالة (status bar) وشريط التنقل (navigation bar).
(
  
  child:Padding(padding:EdgeInsets.only(top: 15),
  child:ListView(
    
    children: [
    Padding(padding: EdgeInsets.symmetric(horizontal: 15),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

InkWell(

onTap: () {
  
},

child: Icon(Icons.sort_rounded,color: Colors.white.withOpacity(0.5),size: 35,),

),
InkWell(

onTap: () {
  
},

child: Icon(Icons.notifications,color: Colors.white.withOpacity(0.5),size: 35,),

)
    ],) ,
    
    ),

SizedBox(height: 30,),
Padding(padding: EdgeInsets.symmetric(horizontal: 15),
child:Text("its a great day for coffe ",style:TextStyle(

color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w500,

) ,) ,


),

Container(
  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
width: MediaQuery.of(context).size.width,//ببساطه هذا السطر يجعل الكونينر يساوي عرض الشاشه ب الكامل
height: 60,
alignment:Alignment.center ,
decoration: BoxDecoration(
  color: Color.fromARGB(255, 50, 54, 56),
  borderRadius: BorderRadius.circular(10),
),
child: TextFormField(
  decoration:InputDecoration(
    hintText: "find your coffe ",
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.5),//ببساطة، الخاصية withOpacity(0.5) تستخدم لتقليل شفافية اللون
    ),

prefixIcon: Icon(Icons.search,size: 30,color:Colors.white.withOpacity(0.5) ,)

  ) ,
),
),


TabBar(
  
  controller:  tapcontroller,
  labelColor: Color(0xffe57734),
  unselectedLabelColor: Colors.white.withOpacity(0.5),
  isScrollable: true,
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(width:3 ,color:Color(0xffe57734), ),
    insets: EdgeInsets.symmetric(horizontal: 16),
  ),
  labelStyle: TextStyle(fontSize:20,fontWeight: FontWeight.w500 ),
  labelPadding: EdgeInsets.symmetric(horizontal:20 ),
  tabs:[

  Tab(text: "hot coffe", ),
    Tab(text: "cold coffe", ),


]),
SizedBox(height: 10,),
Center(child:[
 Itemswidget(),
  Itemswidget(),
  
][ tapcontroller.index],
)

  ],) ,
  
   ),






 ) ,
 bottomNavigationBar:HomeBottombar(),
 );
  }


  
}