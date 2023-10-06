import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
SizedBox(height: 80,),
            Icon(Icons.diamond_outlined,size: 100,),
            SizedBox(height: 40,),

            Text('SHRINE',style: TextStyle(color: Colors.black38,fontSize: 20,
            ),
            ),
            SizedBox(height: 80,),

            Container(

                width: double.infinity,
              height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('usarname',
                  textAlign: TextAlign.left,
                  ),
                ),
                decoration: BoxDecoration(

                  shape: BoxShape.rectangle,
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

                ),
              ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('PassWord',
                  textAlign: TextAlign.left,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

              ),
            ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    Container(
      width: 100,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('cancel',
          textAlign: TextAlign.center
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),

      ),
    ),
                  SizedBox(width: 5,),
                  Container(
                    width: 100,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('next',
                          textAlign: TextAlign.center
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),

                    ),
                  ),


                ],
             )

          ],
        ),
      ),
    );
  }
}
