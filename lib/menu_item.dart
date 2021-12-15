import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;
  const MenuItem(
      {Key? key, required this.icon, this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.cyan,
                size: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
