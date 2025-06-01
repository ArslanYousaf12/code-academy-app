import 'package:code_academy_app/screens/search/widgets/search_app_bar.dart';
import 'package:code_academy_app/screens/search/widgets/search_box.dart';
import 'package:code_academy_app/screens/search/widgets/search_filters.dart';
import 'package:code_academy_app/screens/search/widgets/search_results.dart';
import 'package:code_academy_app/screens/search/widgets/search_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                SearchBox(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      isSearching = value.isNotEmpty;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                if (!isSearching) ...[
                  SearchFilters(),
                  SizedBox(height: 20.h),
                  SearchSuggestions(),
                ] else ...[
                  SearchResults(query: searchQuery),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
