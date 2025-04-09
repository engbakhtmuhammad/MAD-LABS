import 'package:flutter/material.dart';

 customCard({IconData? icon,double? height,double? width,Color? color1,Color? color2}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
              height: height??100,
              width: width??100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color1??Colors.pink,
                    color2??Colors.blue,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon??Icons.abc,color: Colors.white,size: 60,),
            ),
    );
  }