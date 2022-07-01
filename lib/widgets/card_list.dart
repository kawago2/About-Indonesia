import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final GestureTapCallback ontap;
  final String title;
  final String desc;
  CardList({
    Key? key,
    required this.ontap,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
