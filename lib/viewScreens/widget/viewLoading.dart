import 'package:flutter/material.dart';

class ViewLoading extends StatelessWidget {
  const ViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: Column(
          children: [
           const SizedBox(height: 30),
            Image.asset(
              "assets/images/loading.png",
              height: 300,
            ),
            const CircularProgressIndicator(),
          ],
        ));
  }
}
