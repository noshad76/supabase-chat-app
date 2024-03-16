import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/presentation/bloc/bloc/contacts_bloc.dart';
import 'package:chat_app/features/contacts/presentation/widgets/contactsListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      color: const Color.fromARGB(16, 0, 0, 0),
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
                    tabs: const [
                      Text(
                        'All chats',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Groups',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
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
                  child: BlocBuilder<ContactsBloc, ContactsState>(
                    builder: (context, state) {
                      if (state is ContactsLoading) {
                        return const TabBarView(children: [
                          Center(child: CircularProgressIndicator()),
                          Center(child: CircularProgressIndicator()),
                          Center(child: CircularProgressIndicator())
                        ]);
                      } else if (state is ContactsDone) {
                        List<ProfileEntity> contactsDone = state.profiles;

                        return TabBarView(
                          children: <Widget>[
                            ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              clipBehavior: Clip.none,
                              itemCount: contactsDone.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 4.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      topLeft: Radius.circular(30)),
                                  child: ContactViewTiles(
                                    lastOnline: '',
                                    subtilte: '',
                                    username: contactsDone[index].username,
                                  ),
                                );
                              },
                            ),
                            ListView.separated(
                              clipBehavior: Clip.none,
                              itemCount: contactsDone.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 4.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                return ContactViewTiles(
                                  lastOnline: '',
                                  subtilte: '',
                                  username: contactsDone[index].username,
                                );
                              },
                            ),
                            ListView.separated(
                              clipBehavior: Clip.none,
                              itemCount: contactsDone.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 4.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                return ContactViewTiles(
                                  lastOnline: '',
                                  subtilte: '',
                                  username: contactsDone[index].username,
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return const TabBarView(children: [
                          Center(child: CircularProgressIndicator()),
                          Center(child: CircularProgressIndicator()),
                          Center(child: CircularProgressIndicator())
                        ]);
                      }
                    },
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