
import 'package:flutter/material.dart';

class SummeryBox extends StatelessWidget {
  const SummeryBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [
              /*  BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 15
                )*/
                ],
                  color: Color.fromRGBO(246, 234, 232, 1),
                  border: Border.all(color: Color.fromRGBO(246, 234, 232, 1)),
                  borderRadius: BorderRadius.circular(10),),
                padding: const EdgeInsets.all(8.0),
                child: Column(children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
                    Text("Sleep Score",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    
    ]
                    ),

                   
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
                    Text("88",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800),),
                    
    ]
                    ),

                   
                  ),
                   
                  
                  
                ],),
              );
  }
}