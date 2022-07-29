import 'package:flutter/material.dart';

Widget buildImageCard(String info,Size size){
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
    ),
    child: Column(
      children: [
        Stack(
          children: [

            Ink.image(image: const NetworkImage('https://c1.wallpaperflare.com/preview/462/171/638/kuala-lumpur-twins-malaysia-petronas-twin-towers.jpg'

            ),width: size.width ,height: size.height*(1.5/4),fit: BoxFit.cover,),
            const Positioned(
                left: 10,
                bottom: 10,
                child: Text('Petronas Towers',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),))
          ],
        ),

        SizedBox(height: 2,),

        Container(
          width: size.width,
          height: size.height*(1/4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: Text(
                info,
                style: const TextStyle(color: Colors.black,fontSize: 18, ),
              ),
            ),
          ),
        ),


      ],
    ),
  )
  ;
}