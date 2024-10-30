import 'package:flutter/material.dart';

class CicleWidget extends StatelessWidget {
  const CicleWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    late Color color;

    if (status == 'deade'){
      color = Colors.red;
    }else if (status == 'alive'){
      color = Colors.green;
    }else{
      color = Colors.grey;
    }

    return Container(
      height: 10,
      width: 18,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}