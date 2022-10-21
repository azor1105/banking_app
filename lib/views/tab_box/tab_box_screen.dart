import 'package:banking_app/utils/my_colors.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/views/chat/chat_screen.dart';
import 'package:banking_app/views/home/home_screen.dart';
import 'package:banking_app/views/tab_box/widgets/selected_tab_box_icon.dart';
import 'package:banking_app/views/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const TransActionScreen(),
    const ChatScreen(),
  ];

  int currentIndexOfScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndexOfScreen],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 94,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(currentIndexOfScreen != 2 ? 24 : 0),
          ),
        ),
        child: ClipRRect(
          borderRadius:   BorderRadius.vertical(
            top: Radius.circular(currentIndexOfScreen != 2 ? 24 : 0),
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndexOfScreen = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndexOfScreen == 0
                    ? SelectedTabBoxIcon(
                        colors: MyColors.homeIconBackground,
                        iconPath: MyIcons.homeIcon,
                      )
                    : SvgPicture.asset(
                        MyIcons.homeIcon,
                        color: Theme.of(context).primaryColorLight ==
                                MyColors.c8E8E93
                            ? MyColors.c8E8E93
                            : MyColors.white,
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndexOfScreen == 1
                    ? SelectedTabBoxIcon(
                        colors: MyColors.transActionIconBackground,
                        iconPath: MyIcons.transActionIcon,
                      )
                    : SvgPicture.asset(
                        MyIcons.transActionIcon,
                        color: Theme.of(context).primaryColorLight ==
                                MyColors.c8E8E93
                            ? MyColors.c8E8E93
                            : MyColors.white,
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndexOfScreen == 2
                    ? SelectedTabBoxIcon(
                        colors: MyColors.chatIconBackground,
                        iconPath: MyIcons.chatIcon,
                      )
                    : SvgPicture.asset(
                        MyIcons.chatIcon,
                        color: Theme.of(context).primaryColorLight ==
                                MyColors.c8E8E93
                            ? MyColors.c8E8E93
                            : MyColors.white,
                      ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
