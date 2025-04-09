import 'package:flutter/material.dart';

import '../widgets/common.dart';

class ComplexUiScree extends StatelessWidget {
  const ComplexUiScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                width: 300,
                height: 300,
                icon: Icons.wallet
                ,color1: Colors.green,
              ),
              customCard(
                width: 200,
                icon: Icons.call
              ),
              customCard(
                width: 100,
                height: 200,
                icon: Icons.camera
                ,color2: Colors.red,
              ),
              customCard(),
          
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [Colors.pink,Colors.blue]), 
                      ),
                      child: Center(
                        child: Text('Option A',style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Icon(Icons.star,size: 100,color: Colors.pink,),
                    Text("Title Text",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Text("Description Text,\nDescription Text,",style: TextStyle(fontSize: 15),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  
}