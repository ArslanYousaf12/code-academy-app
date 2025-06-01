import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/profile/payment_details/widgets/payment_app_bar.dart';
import 'package:code_academy_app/screens/profile/payment_details/widgets/payment_methods.dart';
import 'package:code_academy_app/screens/profile/payment_details/widgets/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: PaymentAppBar(),
      body: SafeArea(
        child: Column(
          children: [
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
                Tab(text: 'Payment Methods'),
                Tab(text: 'Transaction History'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PaymentMethods(),
                  TransactionHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
