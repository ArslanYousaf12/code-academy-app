import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/chat/widgets/chat_app_bar.dart';
import 'package:code_academy_app/screens/chat/widgets/chat_list.dart';
import 'package:code_academy_app/screens/chat/widgets/active_now.dart';
import 'package:code_academy_app/screens/chat/widgets/search_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ChatAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SearchChat(),
            SizedBox(height: 10.h),
            ActiveNow(),
            SizedBox(height: 20.h),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryElement,
              unselectedLabelColor: AppColors.primarySecondaryElementText,
              indicatorColor: AppColors.primaryElement,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Groups'),
                Tab(text: 'Instructors'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ChatList(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group_outlined,
                          size: 80.w,
                          color: AppColors.primaryThreeElementText,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'No group chats yet',
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Create a study group to collaborate',
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: 80.w,
                          color: AppColors.primaryThreeElementText,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'No instructor chats',
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Ask questions in your courses',
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryElement,
        child: Icon(Icons.add, color: Colors.white, size: 28.w),
      ),
    );
  }
}
