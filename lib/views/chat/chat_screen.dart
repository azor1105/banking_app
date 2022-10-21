import 'dart:math';
import 'package:banking_app/data/models/cached_message/cached_message_model.dart';
import 'package:banking_app/providers/chat_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/views/chat/widgets/message_field.dart';
import 'package:banking_app/views/chat/widgets/message_item.dart';
import 'package:banking_app/views/chat/widgets/send_button.dart';
import 'package:banking_app/views/home/widgets/custom_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  var scrollController = ScrollController();
  int fakeSupportMessageIndex = 0;
  List<String> fakeSupportMessages = [
    "Hello! How can I help you",
    "Please, send your location",
    "Ok, do'nt worry. Service is going to your address",
    "Thanks, for choosing our product",
    "What do you want to know additionaly?"
  ];
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              top: 5,
              bottom: 5,
            ),
            child: CustomSquareButton(
              onPressed: () {},
              iconPath: MyIcons.overflowMenuIcon,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: Padding(
            padding: const EdgeInsets.only(
              left: 14,
              top: 4,
              bottom: 8,
            ),
            child: Image.asset(MyIcons.supportImage)),
        title: Text(
          "Support",
          style: MyFonts.w600.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: context.read<ChatProvider>().messages.length,
              itemBuilder: (context, index) {
                CachedMessageModel cachedMessage =
                    context.read<ChatProvider>().messages[index];
                return MessageItem(cachedMessage: cachedMessage);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.r),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 15.w),
                  child: SvgPicture.asset(
                    MyIcons.attachmentIcon,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                MessageField(
                  onChanged: (v) {
                    setState(() {});
                  },
                  messageController: messageController,
                ),
                SendButton(
                  visible: messageController.text.isNotEmpty,
                  onTap: () async {
                    sendMessage(
                      message: messageController.text,
                      isUser: true,
                    );
                    await Future.delayed(
                      Duration(seconds: Random().nextInt(5)),
                    );
                    sendMessage(
                      message: fakeSupportMessages[fakeSupportMessageIndex],
                      isUser: false,
                    );
                    fakeSupportMessageIndex++;
                    if (fakeSupportMessageIndex >= fakeSupportMessages.length) {
                      fakeSupportMessageIndex = 0;
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void sendMessage({required String message, required bool isUser}) {
    context.read<ChatProvider>().addMessage(
          CachedMessageModel(
            message: message,
            dateTime: DateTime.now(),
            isUser: isUser,
          ),
        );
    if (isUser) {
      messageController.clear();
    }
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    setState(() {});
  }
}
