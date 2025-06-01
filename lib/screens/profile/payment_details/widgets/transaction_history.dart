import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {
      'title': 'Flutter Development Course',
      'date': '2024-05-15',
      'amount': '\$89.99',
      'status': 'Completed',
      'type': 'purchase',
    },
    {
      'title': 'UI/UX Design Masterclass',
      'date': '2024-05-10',
      'amount': '\$79.99',
      'status': 'Completed',
      'type': 'purchase',
    },
    {
      'title': 'Refund - React Course',
      'date': '2024-05-05',
      'amount': '\$45.00',
      'status': 'Refunded',
      'type': 'refund',
    },
    {
      'title': 'JavaScript Fundamentals',
      'date': '2024-04-28',
      'amount': '\$65.99',
      'status': 'Completed',
      'type': 'purchase',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.primaryElement,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.primaryFourElementText.withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              transaction['title'],
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            transaction['amount'],
                            style: TextStyle(
                              color: transaction['type'] == 'refund'
                                  ? Colors.green
                                  : AppColors.primaryElement,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction['date'],
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 14.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: _getStatusColor(transaction['status']).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              transaction['status'],
                              style: TextStyle(
                                color: _getStatusColor(transaction['status']),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'refunded':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      default:
        return AppColors.primarySecondaryElementText;
    }
  }
}
