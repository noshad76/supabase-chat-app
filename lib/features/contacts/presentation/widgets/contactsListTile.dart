import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactViewTiles extends StatelessWidget {
  final String username;
  final String subtilte;
  final String lastOnline;
  const ContactViewTiles({
    super.key,
    required this.username,
    required this.subtilte,
    required this.lastOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 7.h,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundImage: AssetImage(
              'assets/images/profile.jpg',
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Text('this is Subtitle',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontSize: 13))
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '09:38 AM',
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
