import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            child: Text(
                          'hello,',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400),
                        )),
                        Positioned(
                            top: 15,
                            left: 3,
                            child: Text(
                              'Amir hosein',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
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
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(16, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20)),
                  width: 85.w,
                  height: 5.h,
                  child: TabBar(
                    splashBorderRadius: BorderRadius.circular(20),
                    splashFactory: InkRipple.splashFactory,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.black38,
                    labelColor: Theme.of(context).scaffoldBackgroundColor,
                    indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Theme.of(context).primaryColor),
                    tabs: [
                      const Text(
                        'All chats',
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        'Groups',
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        'Contacts',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 74.8.h,
                  width: 85.w,
                  child: TabBarView(
                    children: <Widget>[
                      ListView.separated(
                        physics: BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemCount: 20,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 4.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ContactViewTiles();
                        },
                      ),
                      ListView.separated(
                        clipBehavior: Clip.none,
                        itemCount: 20,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 4.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ContactViewTiles();
                        },
                      ),
                      ListView.separated(
                        clipBehavior: Clip.none,
                        itemCount: 20,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 4.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ContactViewTiles();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.circle_outlined,
            size: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

class ContactViewTiles extends StatelessWidget {
  const ContactViewTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 7.h,
      child: Row(
        children: [
          CircleAvatar(
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
                'Amir Hosein Noshad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text('this is Subtitle',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontSize: 13))
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
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
