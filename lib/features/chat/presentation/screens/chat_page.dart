import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              right: 10,
              top: 0,
              height: 80,
              width: 100,
              child: Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(CircleBorder(
                                  side: BorderSide(color: Colors.black)))),
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_rounded,
                            color: Theme.of(context).primaryColor,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).primaryColor,
                        ),
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(CircleBorder(
                                side: BorderSide(color: Colors.black)))),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              height: 100.h,
              width: 100.w,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: const Column(
                    children: [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(size.width * 0.6, 0)
      ..arcToPoint(Offset((size.width * 0.6) + 45, 45),
          radius: const Radius.circular(45), clockwise: true)
      ..arcToPoint(Offset((size.width * 0.6) + 70, 70),
          radius: const Radius.circular(30), clockwise: false)
      ..lineTo((size.width * 0.92), 70)
      ..arcToPoint(Offset(size.width, 100),
          radius: const Radius.circular(35), clockwise: true)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
