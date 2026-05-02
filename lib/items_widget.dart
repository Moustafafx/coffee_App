import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubites/getdatadrinks/cubit/drinkes_cubit.dart';
import 'package:flutter_app/screen/single_Item_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Itemswidget extends StatelessWidget {
  Itemswidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkesCubit, DrinkesState>(
      builder: (context, state) {
        if(state is Drinkesloading){
        return  Center(child: CircularProgressIndicator());
        }
        else if(state is Drinkessuccess ){
      final drinks=state.drinks;
       return GridView.builder(
        shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
        itemCount: drinks.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:(150 / 195) ),
        itemBuilder: (BuildContext context, int index) {
          return  Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff212325),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => singleItemScreen( description:drinks[index].description, title:drinks[index].title, image: drinks[index].image,),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: CachedNetworkImage(
  placeholder: (context, url) => Center(
    child: CircularProgressIndicator(
      color: Color(0xffe57734),
    ),
  ),
  errorWidget: (context, url, error) => Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      color: Color(0xff2c2f33),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image_not_supported, color: Colors.white38, size: 40),
        SizedBox(height: 6),
        Text("No Image", style: TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    ),
  ),
  width: 120,
  height: 120,
  fit: BoxFit.contain,
  imageUrl: drinks[index].image,
  // ✅ أضف headers عشان بعض السيرفرات بترفض الطلب من غير User-Agent
  httpHeaders: const {
    'User-Agent': 'Mozilla/5.0',
  },
),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                             drinks[index].title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "best coffe ",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$30",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xffe57734),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            CupertinoIcons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
         
          
        );
        }else if (state is Drinkeserror){
       return  Text(state.error);
        }
      return SizedBox();
      },
    );
  }
}
//  physics: NeverScrollableScrollPhysics(),
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           childAspectRatio: ,
//           children: [
           