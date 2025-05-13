import 'package:code_academy_app/app_bloc_providers.dart';

import 'package:code_academy_app/common/routes/pages.dart';
import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/firebase_options.dart';
import 'package:code_academy_app/screens/application/app_dashboard.dart';
import 'package:code_academy_app/screens/register/register.dart';
import 'package:code_academy_app/screens/sigin_in/bloc/sigin_in_bloc.dart';
import 'package:code_academy_app/screens/sigin_in/sigin_in_screen.dart';
import 'package:code_academy_app/screens/welcome/bloc/welcome_blocs.dart';
import 'package:code_academy_app/screens/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.getAllBlocs(context)],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Code academy',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: AppColors.primaryText),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            ),
            // home: const AppDashboard(),
            onGenerateRoute: AppPages.generateRoute,
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text("Counter App With Bloc"),
//       ),
//       body: Center(
//         child: BlocBuilder<AppBlocs, AppState>(
//           builder: (context, state) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text('You have pushed the button this many times:'),
//                 Text(
//                   state.counter.toString(),
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: "heroTag1",
//             onPressed:
//                 () => BlocProvider.of<AppBlocs>(context).add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: "herotag2",
//             onPressed:
//                 () => BlocProvider.of<AppBlocs>(context).add(Decrement()),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
