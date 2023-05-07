import 'package:flutter/material.dart';

class MyBatches extends StatelessWidget {
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

            ElevatedButton(
              onPressed: () {
                // Handle batch 1 button press
              },
              child: Text('Batch 1'),
              style: TextButton.styleFrom(minimumSize: Size(250,40)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle batch 2 button press
              },
              child: Text('Batch 2'),
              style: TextButton.styleFrom(minimumSize: Size(250,40)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle batch 3 button press
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