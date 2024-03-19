import 'package:chat_app/features/chat/presentation/bloc/bloc/get_message_status.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                            Icons.videocam_outlined,
                            color: Theme.of(context).primaryColor,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call_outlined,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 30,
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                              Positioned(
                                right: 1,
                                child: Container(
                                  height: 1.h,
                                  width: 1.h,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      shape: BoxShape.circle),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amir Hosein',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'online',
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.white54,
                                    fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                      BlocBuilder<MessageBloc, MessageState>(
                        builder: (context, state) {
                          MessageState messageState = state;
                          if (messageState.getMessageStatus is GetMessageDone) {
                            GetMessageDone messageDone =
                                state.getMessageStatus as GetMessageDone;
                            return Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    controller: scrollController,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      return Align(
                                        alignment:
                                            messageDone.messages[index].isMine
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: messageDone
                                                    .messages[index].isMine
                                                ? Colors.white
                                                : const Color(0x007B70EE),
                                            borderRadius: messageDone
                                                    .messages[index].isMine
                                                ? const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topLeft:
                                                        Radius.circular(30))
                                                : const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30)),
                                          ),
                                          child: Text(
                                            messageDone.messages[index].content,
                                            style: TextStyle(
                                                color: messageDone
                                                        .messages[index].isMine
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                    itemCount: messageDone.messages.length),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        height: 13.h,
                        width: 100.w,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5.5.h, left: 5.w),
                              height: 12.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.5.w),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.mic_none,
                                          color: Theme.of(context).primaryColor,
                                          size: 7.w,
                                        )),
                                  ),
                                  VerticalDivider(
                                    color: Theme.of(context).primaryColor,
                                    indent: 2.h,
                                    width: 2,
                                    endIndent: 2.h,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 1.w),
                                      width: 48.w,
                                      height: 12.h,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Message',
                                            hintStyle: TextStyle(fontSize: 16),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.attach_file,
                                        color: Theme.of(context).primaryColor,
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 1.5.w),
                              margin: EdgeInsets.only(bottom: 5.5.h, left: 2.w),
                              height: 8.h,
                              width: 8.h,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: IconButton(
                                  alignment: Alignment.center,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 3.5.h,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
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
