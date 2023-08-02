
import 'package:billspliting/splitbill.dart';
import 'package:flutter/material.dart';

class Result2 extends StatefulWidget {
  final friends,tip,tax,total;

  Result2({required this.friends,required this.tip,required this.tax,required this.total});

  @override
  State<Result2> createState() => _Result2State();
}

class _Result2State extends State<Result2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate_bill();
  }
  late double finalbill;
  calculate_bill(){
    double taxamt=double.parse(widget.total)*double.parse(widget.tax.text)/100;
    print(taxamt);
    finalbill=(double.parse(widget.total)+taxamt+widget.tip)/widget.friends;
    print(finalbill);
    return finalbill;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 80,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(width: 10,),
          //     Text('',style: TextStyle(
          //       color: Colors.green,
          //       fontSize: 25,
          //       fontWeight: FontWeight.bold,
          //     ),),
          //   ],
          // ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 2),
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.20),
              width: (MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                color: Colors.green[200],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Equal Amount to be Divided ',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee,color: Colors.white,size: 29,),
                        Text(finalbill.toStringAsFixed(3).toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 33),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text('Friends',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Text('Tax',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Text('Tip',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              SizedBox(height: 3,),
                              Text(widget.friends.toStringAsFixed(0).toString(),style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text(widget.tax.text,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(width: 4,),
                                  Text('%',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Text(widget.tip.toString(),style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Everyone should pay  ',style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
                Icon(Icons.currency_rupee,color: Colors.blueGrey[700],),
                Text(finalbill.toStringAsFixed(2).toString(),style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
              ],
            ),
          ),
          SizedBox(height: 13,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Split()));
            },
            child: Text('Split Again ?',style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                primary: Colors.green[400]
            ),
          ),
        ],
      ),
    );
  }
}