import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.width,
    @required this.hieght,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final double width;
  final double hieght;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [
              Color(0xfff6d365),
              Color(0xfffda085),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 0.6,
              color: Colors.black.withOpacity(0.25),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.white.withOpacity(0.4)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        height: hieght / 9,
        width: double.infinity,
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/screen/$title");
            },
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff031926)),
                  ),
                  Icon(icon, size: 25, color: Color(0xff031926))
                ],
              ),
              height: hieght / 8,
              //width: width / 2.5,
            ),
          ),
        ),
      ),
    );
  }
}
