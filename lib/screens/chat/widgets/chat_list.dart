import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  final List<Map<String, dynamic>> chats = const [
    {
      'name': 'Flutter Study Group',
      'lastMessage': 'Anyone know how to fix this error?',
      'time': '2:30 PM',
      'unreadCount': 3,
      'image': 'assets/icons/headpic.png',
      'isOnline': true,
      'isGroup': true,
    },
    {
      'name': 'Dr. Angela Yu',
      'lastMessage': 'Great question! Let me explain...',
      'time': '1:45 PM',
      'unreadCount': 1,
      'image': 'assets/icons/headpic.png',
      'isOnline': true,
      'isGroup': false,
    },
    {
      'name': 'Sarah Johnson',
      'lastMessage': 'Thanks for the help with the assignment!',
      'time': '12:20 PM',
      'unreadCount': 0,
      'image': 'assets/icons/headpic.png',
      'isOnline': false,
      'isGroup': false,
    },
    {
      'name': 'UI/UX Design Team',
      'lastMessage': 'Check out this amazing design!',
      'time': '11:30 AM',
      'unreadCount': 5,
      'image': 'assets/icons/headpic.png',
      'isOnline': false,
      'isGroup': true,
    },
    {
      'name': 'Mike Chen',
      'lastMessage': 'Let\'s schedule a study session',
      'time': '10:15 AM',
      'unreadCount': 0,
      'image': 'assets/icons/headpic.png',
      'isOnline': true,
      'isGroup': false,
    },
    {
      'name': 'Emma Wilson',
      'lastMessage': 'The lecture was really helpful today',
      'time': 'Yesterday',
      'unreadCount': 0,
      'image': 'assets/icons/headpic.png',
      'isOnline': false,
      'isGroup': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(chat['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (chat['isGroup'])
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                        child: Icon(
                          Icons.group,
                          color: Colors.white,
                          size: 10.w,
                        ),
                      ),
                    )
                  else if (chat['isOnline'])
                    Positioned(
                      bottom: 2.h,
                      right: 2.w,
                      child: Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chat['name'],
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          chat['time'],
                          style: TextStyle(
                            color:
                                chat['unreadCount'] > 0
                                    ? AppColors.primaryElement
                                    : AppColors.primarySecondaryElementText,
                            fontSize: 12.sp,
                            fontWeight:
                                chat['unreadCount'] > 0
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chat['lastMessage'],
                            style: TextStyle(
                              color:
                                  chat['unreadCount'] > 0
                                      ? AppColors.primaryText
                                      : AppColors.primarySecondaryElementText,
                              fontSize: 14.sp,
                              fontWeight:
                                  chat['unreadCount'] > 0
                                      ? FontWeight.w500
                                      : FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        if (chat['unreadCount'] > 0)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              chat['unreadCount'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
