import 'package:chat_app/features/chat/presentation/bloc/bloc/get_message_status.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/message_bloc.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/send_message_status.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatefulWidget {
 const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final scrollController = ScrollController();

  final TextEditingController textEditingController = TextEditingController();

  submitMessage(BuildContext context, String messageContent) {
    textEditingController.clear();
    BlocProvider.of<MessageBloc>(context)
        .add(SendMessage(messageContent: messageContent));
    setState(() {});
  }

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
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
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
                      BlocConsumer<MessageBloc, MessageState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state.getMessageStatus is GetMessageDone) {
                            GetMessageDone messageDone =
                                state.getMessageStatus as GetMessageDone;
                            return Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
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
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                minHeight: 30,
                                                minWidth: 30,
                                                maxWidth: 300),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: messageDone
                                                        .messages[index].isMine
                                                    ? Colors.white
                                                    : const Color.fromARGB(
                                                        255, 123, 112, 238),
                                                borderRadius: messageDone
                                                        .messages[index].isMine
                                                    ? const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(25),
                                                        bottomRight:
                                                            Radius.circular(25),
                                                        topLeft:
                                                            Radius.circular(25))
                                                    : const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(25),
                                                        bottomRight:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(
                                                                25)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                                child: Text(
                                                  messageDone
                                                      .messages[index].content,
                                                  textAlign: messageDone
                                                          .messages[index]
                                                          .isMine
                                                      ? TextAlign.end
                                                      : TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      color: messageDone
                                                              .messages[index]
                                                              .isMine
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : Colors.white),
                                                ),
                                              ),
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
                              ),
                            );
                          } else {
                            return const Expanded(
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            );
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
                                      child: TextField(
                                        controller: textEditingController,
                                        decoration: const InputDecoration(
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
                              child: BlocConsumer<MessageBloc, MessageState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state.sendMessageStatus
                                      is SendMessageLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state.sendMessageStatus
                                      is SendMessageDone) {
                                    return IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          submitMessage(context,
                                              textEditingController.text);
                                        },
                                        icon: Icon(
                                          Icons.send_rounded,
                                          color: Theme.of(context).primaryColor,
                                          size: 3.5.h,
                                        ));
                                  } else if (state.sendMessageStatus
                                      is SendMessageFaild) {
                                    return IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          submitMessage(context,
                                              textEditingController.text);
                                        },
                                        icon: Icon(
                                          Icons.send_rounded,
                                          color: Colors.red,
                                          size: 3.5.h,
                                        ));
                                  } else {
                                    return IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          submitMessage(context,
                                              textEditingController.text);
                                        },
                                        icon: Icon(
                                          Icons.send_rounded,
                                          color: Theme.of(context).primaryColor,
                                          size: 3.5.h,
                                        ));
                                  }
                                },
                              ),
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
