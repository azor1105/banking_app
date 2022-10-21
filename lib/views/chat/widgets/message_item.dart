import 'package:banking_app/data/models/cached_message/cached_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.cachedMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Stack(
        children: [
          Align(
            alignment:
                cachedMessage.isUser ? Alignment.topRight : Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                right: cachedMessage.isUser ? 16 : 0,
                left: !cachedMessage.isUser ? 16 : 0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: cachedMessage.isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.jm().format(cachedMessage.dateTime),
                      style: MyFonts.w400.copyWith(
                        fontSize: 14.sp,
                        color: MyColors.c636366,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: !cachedMessage.isUser
                            ? MyColors.c5E5CE6
                            : Theme.of(context).hintColor == Colors.black
                                ? MyColors.white
                                : MyColors.c1C1C1E,
                      ),
                      child: Text(
                        cachedMessage.message,
                        style: MyFonts.w600.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final CachedMessageModel cachedMessage;
}
