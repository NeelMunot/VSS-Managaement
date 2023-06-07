import 'package:VSS/Backend.dart';
import 'package:flutter/material.dart';

class AdminBatches extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batches'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Select Your Batch", style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
             ),
            ),
            SizedBox(height: 20,),
            Text("Incharge of ${Batches.Alloted_batch} Batch", style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
             ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                if(Batches.Alloted_batch !="B1")
                {
                  Batches.set_admin_batch("B1");
                  popups.showMessage(context, "You are alloted to 'B1' Batch Successfully");
                }
                else
                {
                  popups.showMessage(context, "You are already assigned to 'B1' Batch");

                }
              },
              child: Text('Batch 1'),
              style: TextButton.styleFrom(minimumSize: Size(250,40)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if(Batches.Alloted_batch !="B2")
                {
                  Batches.set_admin_batch("B2");
                  popups.showMessage(context, "You are alloted to 'B2' Batch Successfully");
                }
                else
                {
                  popups.showMessage(context, "You are already assigned to 'B2' Batch");

                }
              },
              child: Text('Batch 2'),
              style: TextButton.styleFrom(minimumSize: Size(250,40)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if(Batches.Alloted_batch !="B3")
                {
                  Batches.set_admin_batch("B3");
                  popups.showMessage(context, "You are alloted to 'B3' Batch Successfully");
                }
                else
                {
                  popups.showMessage(context, "You are already assigned to 'B3' Batch");

                }
              },
              child: Text('Batch 3'),
              style: TextButton.styleFrom(minimumSize: Size(250,40)),
            ),
          ],
        ),
      ),
    );
  }
}