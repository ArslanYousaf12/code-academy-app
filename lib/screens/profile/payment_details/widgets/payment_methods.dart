import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  final List<Map<String, dynamic>> paymentMethods = const [
    {
      'type': 'Credit Card',
      'name': 'Visa ending in 1234',
      'icon': Icons.credit_card,
      'isDefault': true,
    },
    {
      'type': 'PayPal',
      'name': 'paypal@example.com',
      'icon': Icons.payment,
      'isDefault': false,
    },
    {
      'type': 'Apple Pay',
      'name': 'Touch ID',
      'icon': Icons.phone_iphone,
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Payment Methods',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color:
                          method['isDefault']
                              ? AppColors.primaryElement
                              : AppColors.primaryFourElementText.withOpacity(
                                0.3,
                              ),
                      width: method['isDefault'] ? 2 : 1,
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
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          method['icon'],
                          color: AppColors.primaryElement,
                          size: 24.w,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              method['type'],
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              method['name'],
                              style: TextStyle(
                                color: AppColors.primarySecondaryElementText,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (method['isDefault'])
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Default',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.more_vert,
                        color: AppColors.primaryThreeElementText,
                        size: 20.w,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.h,
            margin: EdgeInsets.only(top: 20.h),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryElement,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Add New Payment Method',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
