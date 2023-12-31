import 'dart:math';

import 'package:billspliting/result.dart';
import 'package:flutter/material.dart';

class Split extends StatefulWidget {
  const Split({Key? key}) : super(key: key);

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {

  double _value = 0;
  double value=0;
  double counter=0;
  String res = "";
  String change="";
  TextEditingController tax=TextEditingController();

  total(String amt){
    if(amt=='CLR'){
      res=res.substring(0,res.length-1);
    }
    else{
      res = res + amt;
    }
    setState(() {
      res;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('SPLIT BILL',style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 2),
              child: Container(
                //color: Colors.blueGrey,
                height: (MediaQuery.of(context).size.height * 0.23),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(15),),
                  color: Colors.green[200],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 39,right: 15),
                      child: Column(
                        children: [
                          const SizedBox(height: 35,),
                          const Text('Total',style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          )),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,color: Colors.white,),
                              Text(res,style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(width: 28,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  SizedBox(height: 10,),
                                  Text('Friends',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(height: 10,),
                                  Text('Tax',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(height: 10,),
                                  Text('Tip',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  Text(_value.toStringAsFixed(0),style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(change.toString(),style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      const SizedBox(width: 4,),
                                      Icon(Icons.percent,color: Colors.white,),

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text('$counter',style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Text('How many friends ?',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28
            ),),
            const SizedBox(height: 5,),
            Slider(
                min: 0,
                max: 50,activeColor: Colors.green[200],
                value: _value,
                onChanged: (value){
                  setState(() {
                    _value = value;
                  });
                }
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 2),
                  child: Container(
                    height: 110,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15),),
                      color: Colors.green[200],
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 16),
                          child: Text('Tip',style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: FloatingActionButton(
                                  child: const Icon(Icons.remove,color: Colors.blueGrey,),
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    setState(() {

                                    });
                                    counter=max(counter-1, 0);
                                  },
                                ),
                              ),
                              Text('$counter',style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),),
                              Container(
                                width: 40,
                                height: 40,
                                child: FloatingActionButton(
                                  child: const Icon(Icons.add,color: Colors.blueGrey,),
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    setState(() {

                                    });
                                    counter++;
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 2),
                  child: Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15),),
                      color: Colors.green[200],
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          child: Text('Tax in %',style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 35,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top: 5),
                              child: TextField(
                                onTap: (){
                                  setState(() {
                                  });
                                },

                                onChanged: (value){
                                  setState(() {
                                    change=value;
                                  });

                                },
                                controller: tax,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(height: 1,fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50,top: 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCircleAvatar('1'),
                      buildCircleAvatar('2'),
                      buildCircleAvatar('3')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCircleAvatar('4'),
                      buildCircleAvatar('5'),
                      buildCircleAvatar('6')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCircleAvatar('7'),
                      buildCircleAvatar('8'),
                      buildCircleAvatar('9')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCircleAvatar('.',),
                      buildCircleAvatar('0',),
                      buildCircleAvatar('CLR',),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Result2(friends:_value,tax:tax,total:res,tip:counter)));
              },
              child: const Text('Split Bill',style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 140.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  primary: Colors.green[400]
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  CircleAvatar buildCircleAvatar(String value) {
    return CircleAvatar(
      radius: 30,
      backgroundColor : Colors.grey[100],
      child: TextButton(
        child: Text(value,style: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 33,
          fontWeight: FontWeight.bold,
        )),
        onPressed: (){
          total(value);
        },
      ),
    );
  }
}
