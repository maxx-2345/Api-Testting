import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider_demo/product_list_with_provider.dart';
import 'package:testing/provider_demo/product_provider.dart';
import 'package:testing/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'API Test',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const Homescreen(),
//     );
//   }
// }

///with provider: need to add ChangeNotifierProvider to start with provider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),//provider class
      child: MaterialApp(
        title: 'DummyJSON Products Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}